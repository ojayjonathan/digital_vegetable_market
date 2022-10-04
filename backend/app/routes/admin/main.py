from typing import List
from fastapi import APIRouter, Depends, Body
from sqlalchemy.orm import Session
from app.routes.deps import admin_user, get_db
from app.repository import order_repo, user_repo
from app import schema

router = APIRouter(prefix="/admin", dependencies=[Depends(admin_user)])


@router.get("/orders", response_model=List[schema.Order], tags=["orders"])
async def orders(
    db: Session = Depends(get_db),
):
    return order_repo.get_all(db)


@router.post("/orders/{id}", response_model=schema.Order, tags=["orders"])
async def update_order(
    id: int,
    db: Session = Depends(get_db),
    item: schema.OrderUpdate = Body(...),
):
    order = order_repo.get_object_or_404(db, id=id)
    return order_repo.update(db, item_in=item, current_item=order)


@router.get("/users", response_model=List[schema.User], tags=["users"])
async def users(
    db: Session = Depends(get_db),
):
    return user_repo.get_all(db)


@router.post("/users/{id}", response_model=schema.User, tags=["users"])
async def update_user(
    id: int,
    db: Session = Depends(get_db),
    item: schema.UserUpdate = Body(...),
):
    user = user_repo.get_object_or_404(db, id=id)
    return user_repo.update(db, item_in=item, current_item=user)
