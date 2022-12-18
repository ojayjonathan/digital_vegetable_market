from sqlalchemy import Column, Float, DateTime, String
from app.db.base_class import Base
from app.utils.utils import tz_now


# M-pesa Payment models
class MpesaCall(Base):
    ip_address = Column(String(50))
    caller = Column(String(100))
    conversation_id = Column(String(100))
    content = Column(String(500))
    created_at = Column(DateTime(), default=tz_now(), nullable=False)
    updated_at = Column(DateTime(), default=tz_now(), nullable=False)


class MpesaCallBack(Base):
    ip_address = Column(String(50))
    caller = Column(String(50))
    conversation_id = Column(String(50))
    content = Column(String(50))
    created_at = Column(DateTime(), default=tz_now(), nullable=False)
    updated_at = Column(DateTime(), default=tz_now(), nullable=False)


class MpesaPayment(Base):
    amount = Column(Float(precision=2), nullable=False, default=1)
    description = Column(String(50))
    type = Column(String(50))
    reference = Column(String(50))
    first_name = Column(String(100))
    middle_name = Column(String(100))
    last_name = Column(String(100))
    phone_number = Column(String(50))
    organization_balance = Column(Float(precision=2), nullable=False, default=1)
    created_at = Column(DateTime(), default=tz_now(), nullable=False)
    updated_at = Column(DateTime(), default=tz_now(), nullable=False)

    def __str__(self):
        return self.first_name
