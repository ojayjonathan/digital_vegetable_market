from sqlalchemy import Column, Float, ForeignKey, Integer, String, Date
from sqlalchemy.orm import relationship
from app.db.base_class import Base
from .user import User


class Product(Base):
    image_url = Column(String(150),nullable=False)
    description = Column(String(200))
    expected_available_date = Column(Date(), nullable=False)
    measurement_unit = Column(String(30), nullable=False)
    price = Column(Float(), nullable=False)
    available_quantity = Column(Float(), nullable=False)
    owner_id = Column(ForeignKey(f"{User.__tablename__}.id"),nullable=False)

    owner = relationship(User.__tablename__)
