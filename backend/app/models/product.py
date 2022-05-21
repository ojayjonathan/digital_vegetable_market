from sqlalchemy import Column, Float, ForeignKey, Integer, String, Date
from sqlalchemy.orm import relationship
from app.db.base_class import Base
from .user import User


class Product(Base):
    status = Column(String(2), nullable=False)
    expected_available_date = Column(Date(), nullable=False)
    measurement_unit = Column(String(30), nullable=False)
    price = Column(Float(), nullable=False)
    available_quantity = Column(Float(), nullable=False)
    owner_id = Column(ForeignKey(f"{User.__tablename__}.id"))

    owner = relationship(User.__tablename__)
