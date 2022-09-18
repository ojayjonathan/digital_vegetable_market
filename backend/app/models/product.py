from enum import Enum
from sqlalchemy import Column, Float, ForeignKey, Integer, String, Date
from sqlalchemy.orm import relationship
from app.db.base_class import Base
from app.models.address import Address
from .user import User


class ProductCategory(str, Enum):
    FRUITS = "FRUITS"
    VEGETABLES = "VEGETABLES"


class Product(Base):
    image = Column(String(150), nullable=False)
    name = Column(String(100), nullable=False)
    category: ProductCategory = Column(String(20), nullable=False)
    description = Column(String(1000))
    expected_available_date = Column(Date(), nullable=False)
    measurement_unit = Column(String(30), nullable=False)
    price = Column(Float(), nullable=False)
    available_quantity = Column(Float(), nullable=False)
    owner_id = Column(ForeignKey(f"{User.__tablename__}.id"), nullable=False)
    address_id = Column(ForeignKey(f"{Address.__tablename__}.id"), nullable=False)
    address = relationship(Address.__tablename__)
    owner = relationship(User.__tablename__)

    @property
    def image_url(self):
        return f"/{self.owner_id}/{self.id}/{self.image}"
