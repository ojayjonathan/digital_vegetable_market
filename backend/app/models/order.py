from __future__ import annotations
import enum
from sqlalchemy import Column, DateTime, Float, ForeignKey, String, Boolean
from sqlalchemy.orm import relationship
from app.db.base_class import Base
from app.models.address import Address
from app.utils.utils import date_format, tz_now
from .user import User
from .payment import Payment
from .product import Product
from random import randint

def order_number_gen():
    numbers = "".join(str(i) for i in range(10))
    return "".join(numbers[randint(0, 9)] for i in range(5))

class OrderStatus(str, enum.Enum):
    DELIVERED = "DELIVERED"
    CANCELLED = "CANCELLED"
    PENDING = "PENDING"
    ACTIVE = "ACTIVE"


class OrderStatusEvent(str, enum.Enum):
    CREATED = "CREATED"
    CANCELLED = "CANCELLED"
    CONFIRMED = "CONFIRMED"
    DELIVERED = "DELIVERED"
    OTHER = "OTHER"
    PROCESSED = "PROCESSED"


class Order(Base):
    order_number = Column(String(5), default=order_number_gen())
    created_at = Column(DateTime(), default=tz_now(), nullable=False)
    user_id = Column(ForeignKey(f"{User.__tablename__}.id"), nullable=False)
    payment_id = Column(ForeignKey(f"{Payment.__tablename__}.id"))
    user = relationship(User.__tablename__)
    payment = relationship(Payment.__tablename__)
    order_items = relationship("OrderItem")
    shipment_cost = Column(Float(), default=0, nullable=False)
    detail = relationship("OrderDetail", foreign_keys="OrderDetail.order_id")
    status: OrderStatus = Column(
        String(10), nullable=False, default=OrderStatus.PENDING
    )
    delivery_address_id = Column(
        ForeignKey(f"{Address.__tablename__}.id"), nullable=False
    )
    delivery_address = relationship(Address.__tablename__)

    @property
    def total(self):
        return sum([item.quantity * item.product.price for item in self.order_items])

    @property
    def created_at_format(self):
        return date_format(self.created_at)

    @property
    def quantity(self):
        return len(self.order_items)


class OrderItem(Base):
    product_id = Column(ForeignKey(f"{Product.__tablename__}.id"), nullable=False)
    product = relationship(
        f"{Product.__tablename__}",
    )
    order_id = Column(
        ForeignKey(f"{Order.__tablename__}.id", ondelete="CASCADE"),
        nullable=False,
    )
    quantity = Column(Float(precision=2), nullable=False)
    delivered: bool = Column(Boolean(), nullable=False, default=False)


class OrderDetail(Base):
    order_id = Column(ForeignKey(f"{Order.__tablename__}.id", ondelete="CASCADE"))
    message = Column(String(1000), nullable=False)
    created_at = Column(DateTime(), default=tz_now(), nullable=False)
    order_item_id = Column(ForeignKey(f"{Order.__tablename__}.id"))
    event = Column(String(30), nullable=False, default="OTHER")


