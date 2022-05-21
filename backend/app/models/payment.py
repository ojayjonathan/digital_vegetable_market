from sqlalchemy import Column, Float, DateTime, String
from app.db.base_class import Base
from app.utils.utils import tz_now


class Payment(Base):
    amount = Column(Float(precision=2), nullable=False)
    created_at = Column(DateTime(), default=tz_now())
    status = Column(String(2), nullable=False)
    type = Column(String(2), nullable=False)
    
