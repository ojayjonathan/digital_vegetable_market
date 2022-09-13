from sqlalchemy import Column, Float, ForeignKey, Integer, PrimaryKeyConstraint, String
from app.db.base_class import Base

from .user import User


class Address(Base):
    user_id = Column(ForeignKey(f"{User.__tablename__}.id"), nullable=False)
    latitude = Column(Float(precision=5), nullable=False)
    longitude = Column(Float(precision=5), nullable=False)
    address = Column(String(100))
    title = Column(String(50))
