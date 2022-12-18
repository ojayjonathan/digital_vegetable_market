import json
from fastapi import Request, Depends, APIRouter, Form
from app.core.config import Setting, get_setting
from app import schema, models
import requests
from app.routes.deps import get_db, current_user
from app.utils.mpesa import mpesa_access_token, lipa_na_mpesa_password
from sqlalchemy.orm import Session
from typing import Optional

from app.utils.send_mail import send_mail


router = APIRouter(prefix="/mpesa", tags=["Mpesa"])


@router.post("/", response_model=schema.MessageResponse)
def pay(
    request: Request,
    settings: Setting = Depends(get_setting),
    user: models.User = Depends(current_user),
    phone: Optional[str] = Form(None),
):
    phone = phone or user.phone_number
    phone = f"254{phone[1:]}"
    print(settings.CONSUMER_KEY, settings.CONSUMER_SECRET)
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
    print(request)
    response = requests.post(api_url, json=request, headers=headers)

   
    print(response.content, response.status_code)
    return schema.MessageResponse(message="Payment Successful")


@router.get("/register")
def register_urls(request: Request, settings: Setting = Depends(get_setting)):
    access_token = mpesa_access_token(
        "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials",
        consumer_key=settings.CONSUMER_KEY,
        consumer_secret=settings.CONSUMER_SECRET,
    )

    api_url = "https://sandbox.safaricom.co.ke/mpesa/c2b/v1/registerurl"
    headers = {"Authorization": "Bearer %s" % access_token}
    password = lipa_na_mpesa_password(settings.PASSKEY)
    options = {
        "ShortCode": settings.SHORTCODE,
        "ResponseType": "Completed",
        "ConfirmationURL": f"{settings.NGROK_BASE_URL}/api/mpesa/confirmation",
        "ValidationURL": f"{settings.NGROK_BASE_URL}/api/mpesa/validation",
    }

    response = requests.post(api_url, json=options, headers=headers)
    return json.loads(request.body)


@router.get("/callback")
def call_back(request: Request):
    pass


@router.get("/confirmation")
def confirmation(
    request: Request,
    db: Session = Depends(get_db),
):
    mpesa_body = request.body.decode("utf-8")
    print(mpesa_body)
    mpesa_payment = json.loads(mpesa_body)
    payment = models.MpesaPayment(
        first_name=mpesa_payment["FirstName"],
        last_name=mpesa_payment["LastName"],
        middle_name=mpesa_payment["MiddleName"],
        description=mpesa_payment["TransID"],
        phone_number=mpesa_payment["MSISDN"],
        amount=mpesa_payment["TransAmount"],
        reference=mpesa_payment["BillRefNumber"],
        organization_balance=mpesa_payment["OrgAccountBalance"],
        type=mpesa_payment["TransactionType"],
    )
    try:
        db.add(payment)
        db.commit()
    except Exception as e:
        print(e)

    return {"ResultCode": 0, "ResultDesc": "Accepted"}
