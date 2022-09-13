from __future__ import annotations

from datetime import datetime
from typing import Any, List, Optional
from pydantic import BaseModel, Field
from app.schema.address import AddressCreate, Address

from app.schema.payment import Payment
from .user import User
from app.models.order import OrderStatus


class OrderItem(BaseModel):
    product_id: int
    order_id: int
    quantity: float
    delivered: bool
    id: int

    class Config:
        orm_mode = True


class Order(BaseModel):
    created_at: datetime
    payment: Optional[Payment]

    user: User
    order_items: List[OrderItem]
    status: OrderStatus
    id: int
    delivery_address: Address

    class Config:
        orm_mode = True


class OrderItemCreate(BaseModel):
    product_id: int
    quantity: float


class OrderCreate(BaseModel):
    order_items: List[OrderItemCreate]
    delivery_address_id: int


class OrderItemUpdate(BaseModel):
    quantity: Optional[float]
    delivered: Optional[bool]
    id: int


class OrderUpdate(BaseModel):
    payment_id: Optional[int]
    status: Optional[OrderStatus]
