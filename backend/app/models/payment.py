import enum
from sqlalchemy import Column, Float, DateTime, String
from app.db.base_class import Base
from app.utils.utils import tz_now


class PaymentStatus(str, enum.Enum):
    PENDING = "PENDING"
    COMPLETED = "COMPLETED"
    CANCELLED = "CANCELED"
    REVERSED = "REVERSED"


class PaymentMode(str, enum.Enum):
    ONLINE = "ONLINE"


class Payment(Base):
    amount = Column(Float(precision=2), nullable=False, default=0)
    created_at = Column(DateTime(), default=tz_now())
    status = Column(String(10), nullable=False)
    mode = Column(String(10), nullable=False)
