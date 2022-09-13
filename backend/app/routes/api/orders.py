from typing import List
from fastapi import APIRouter, Depends, Body
from app import schema, models
from app.routes.deps import get_db, current_user
from sqlalchemy.orm import Session
from app.repository.orders import order_repo


router = APIRouter(prefix="/orders", tags=["orders"])


@router.get("/", response_model=List[schema.Order])
async def orders(
    db: Session = Depends(get_db),
    user: models.User = Depends(current_user),
):
    return order_repo.filter_by(db, user_id=user.id).all()


@router.post("/")
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
