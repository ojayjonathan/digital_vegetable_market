from datetime import datetime
import os
from typing import List
from fastapi import APIRouter, Depends, Body
from app import schema, models
from app.core.config import Setting, get_setting
from app.routes.deps import get_db, current_user
from sqlalchemy.orm import Session
from app.repository.orders import order_repo
import pdfkit
from app.utils.utils import date_format, render_template


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
):
    return order_repo.create(db, item=item, user_id=user.id)


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
    return {"path": f"media/{user.id}/receipt/{order.id}.pdf"}
