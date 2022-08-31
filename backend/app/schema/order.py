from __future__ import annotations

from datetime import datetime
from typing import Any, List, Optional
from pydantic import BaseModel, Field

from app.schema.payment import Payment
from .user import User
from app.models.order import OrderStatus


class OrderItem(BaseModel):
    product_id: int
    order_id: int
    quantity: float
    delivered: bool
    id: int

    class Meta:
        orm_mode = True


class Order(BaseModel):
    created_at: datetime
    pick_up_date: datetime
    type: str
    payment: Optional[Payment]

    user: User
    orders_items: List[OrderItem]
    status: OrderStatus
    id: int

    class Meta:
        orm_mode = True


class OrderItemCreate(BaseModel):
    product_id: int
    quantity: float
    delivered: Optional[bool] = False


class OrderCreate(BaseModel):
    created_at: datetime
    pick_up_date: datetime
    type: str
    user_id: Optional[int]
    orders_items: List[OrderItemCreate]


class OrderItemUpdate(BaseModel):
    quantity: Optional[float]
    delivered: Optional[bool]
    id: int


class OrderUpdate(BaseModel):
    pick_up_date: Optional[datetime]
    type: Optional[str]
    payment_id: Optional[int]
    status: Optional[OrderStatus]
