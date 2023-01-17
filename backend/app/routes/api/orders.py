from datetime import datetime
from email import encoders
from email.mime.base import MIMEBase
import os
from typing import List
from fastapi import APIRouter, Depends, Body
from app import schema, models
from app.core.config import Setting, get_setting
from app.routes.deps import get_db, current_user
from sqlalchemy.orm import Session
from app.repository.orders import order_repo
import pdfkit
from app.utils.mpesa import lipa_na_mpesa_password, mpesa_access_token
from app.utils.send_mail import send_mail
from app.utils.utils import date_format, render_template
import requests


router = APIRouter(prefix="/orders", tags=["orders"])


@router.get("/", response_model=List[schema.Order])
async def orders(
    db: Session = Depends(get_db),
    user: models.User = Depends(current_user),
):
    return order_repo.filter_by(db, user_id=user.id).all()


@router.post("/", response_model=schema.Order)
async def create_order(
    db: Session = Depends(get_db),
    user: models.User = Depends(current_user),
    item: schema.OrderCreate = Body(...),
    settings: Setting = Depends(get_setting),
):
    phone = item.phone_number or user.phone_number
    phone = f"254{phone[1:]}"
    order = order_repo.create(db, item=item, user_id=user.id)
    access_token = mpesa_access_token(
        "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials",
        consumer_key=settings.CONSUMER_KEY,
        consumer_secret=settings.CONSUMER_SECRET,
    )
    api_url = "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"
    headers = {"Authorization": "Bearer %s" % access_token}
    password = lipa_na_mpesa_password(
        settings.PASSKEY, short_code=settings.BUSINESS_SHORT_CODE
    )

    request = {
        "BusinessShortCode": settings.BUSINESS_SHORT_CODE,
        "Password": password["decode_password"],
        "Timestamp": password["lipa_time"],
        "TransactionType": "CustomerPayBillOnline",
        "Amount": 1,
        # "PartyA": 254791381653,  # replace with your phone number to get stk push
        "PartyA": phone,  # replace with your phone number to get stk push
        "PartyB": settings.BUSINESS_SHORT_CODE,
        "PhoneNumber": phone,  # replace with your phone number to get stk push
        "CallBackURL": f"{settings.NGROK_BASE_URL}/api/mpesa/confirmation",
        "AccountReference": "Courier",
        "TransactionDesc": "Payment for shipment",
    }

    response = requests.post(api_url, json=request, headers=headers)
    print(response.content, response.status_code)

    receipt = gen_receipt(order, user, settings)
    with open(receipt, "rb") as file:
        part = MIMEBase("application", "octet-stream")
        part.set_payload((file).read())
        encoders.encode_base64(part)
        part.add_header(
            "Content-Disposition", "attachment; filename= " + f"{order.id}_order.pdf"
        )

    send_mail(
        sender=settings.sender,
        sender_password=settings.sender_password,
        subject="INVOICE",
        contentType="html",
        message="""
        <p>Thank your for shopping with us</p>
            """,
        recipient=user.email,
        extra=part,
        port=settings.port,
        smtp_server=settings.smtp_server,
    )
    return order


@router.post("/{id}", response_model=schema.Order)
async def update_order(
    id: int,
    db: Session = Depends(get_db),
    user: models.User = Depends(current_user),
    item: schema.OrderUpdate = Body(...),
):
    order = order_repo.get_object_or_404(db, id=id, user_id=user.id)
    return order_repo.update(db, item_in=item, current_item=order)


@router.delete("/{id}", response_model=schema.Order)
async def delete_order(
    id: int,
    db: Session = Depends(get_db),
    _: models.User = Depends(current_user),
):
    return order_repo.delete(db, id=id)


@router.get("/{id}", response_model=schema.Order)
async def order_details(
    id: int,
    db: Session = Depends(get_db),
    _: models.User = Depends(current_user),
):
    return order_repo.get_object_or_404(db, id=id)


@router.get("/receipt/{id}")
async def order_receipt(
    id: int,
    db: Session = Depends(get_db),
    user: models.User = Depends(current_user),
    settings: Setting = Depends(get_setting),
):
    order = order_repo.get_object_or_404(db, id=id)
    return {"path": gen_receipt(order, user, settings)}


def gen_receipt(order, user, settings):
    template = render_template(
        "receipt/index.html",
        {
            "user": user,
            "order": order,
            "now": date_format(datetime.now()),
            "address": order.delivery_address,
        },
    )

    url = f"{settings.MEDIA_URL}{user.id}/receipt/"
    if not os.path.exists(url):
        os.makedirs(url)

    pdfkit.from_string(template, f"{url}{order.id}.pdf")
    return f"media/{user.id}/receipt/{order.id}.pdf"
