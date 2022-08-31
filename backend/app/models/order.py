from __future__ import annotations
import enum
from sqlalchemy import Column, DateTime, Float, ForeignKey, String, Boolean
from sqlalchemy.orm import relation
from app.db.base_class import Base
from app.utils.utils import tz_now
from .user import User
from .payment import Payment
from .product import Product


class OrderStatus(str, enum.Enum):
    DELIVERED = "DELIVERED"
    CANCELLED = "CANCELLED"
    PENDING = "PENDING"
    ACTIVE = "ACTIVE"


class Order(Base):
    created_at = Column(DateTime(), default=tz_now(), nullable=False)
    pick_up_date = Column(DateTime(), nullable=False)
    type = Column(String(2), nullable=False)
    user_id = Column(ForeignKey(f"{User.__tablename__}.id"))
    payment_id = Column(ForeignKey(f"{Payment.__tablename__}.id"))

    user = relation(User.__tablename__)
    payment = relation(Payment.__tablename__)
    orders_items = relation(
        "OrderItem",
    )
    status: OrderStatus = Column(
        String(10), nullable=False, default=OrderStatus.PENDING
    )


class OrderItem(Base):
    product_id = Column(ForeignKey(f"{Product.__tablename__}.id"))
    order_id = Column(ForeignKey(f"{Order.__tablename__}.id"))
    quantity = Column(Float(precision=2), nullable=False)
    delivered: bool = Column(Boolean(), nullable=False, default=False)
