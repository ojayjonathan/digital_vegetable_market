from __future__ import annotations

from datetime import datetime
from enum import Enum
from typing import Any, List, Optional
from pydantic import BaseModel, Field
from app.schema.address import AddressCreate, Address
from app.schema.products import Product

from app.schema.payment import Payment
from app.utils.utils import tz_now
from .user import User
from app.models.order import OrderStatus, OrderStatusEvent


class OrderDetail(BaseModel):
    order_id: int
    message: str
    created_at: datetime = Field(default=tz_now())
    order_item_id: Optional[int]
    event: OrderStatusEvent = Field(OrderStatusEvent.OTHER)

    class Config:
        orm_mode = True


class OrderItem(BaseModel):
    product_id: int
    order_id: int
    product: Product
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
    detail: List[OrderDetail]
    status: OrderStatus
    id: int
    delivery_address: Address
    shipment_cost: float

    class Config:
        orm_mode = True


class OrderItemCreate(BaseModel):
    product_id: int
    quantity: float


class OrderCreate(BaseModel):
    order_items: List[OrderItemCreate]
    delivery_address_id: int
    phone_number:Optional[str] = Field(None)


class OrderItemUpdate(BaseModel):
    quantity: Optional[float]
    delivered: Optional[bool]
    id: int


class OrderUpdate(BaseModel):
    payment_id: Optional[int]
    status: Optional[OrderStatus]
    order_items: List[OrderItemUpdate] = Field([])


class SalesFreq(str):
    DAILY = "day"
    WEEKLY = "week"
    MONTHLY = "month"
    YEALY = "year"

    def __str__(self) -> str:
        return self.lower
