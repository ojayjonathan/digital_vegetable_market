from sqlalchemy import Column, Float, ForeignKey, Integer, String
from app.models.user import Driver
from sqlalchemy.orm import relation
from app.db.base_class import Base


class Vehicle(Base):
    driver_id = Column(ForeignKey(f"{Driver.__tablename__}.id", ondelete="CASCADE"))
    type = Column(String(1), nullable=False)
    registration_number=Column(String(10), nullable=False)
    capacity = Column(Float(), nullable=False)

    driver: Driver = relation(Driver.__name__)
