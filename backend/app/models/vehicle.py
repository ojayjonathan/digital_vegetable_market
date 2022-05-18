from sqlalchemy import Column, Float, ForeignKey, Integer, String
from app.models.user import Driver
from sqlalchemy.orm import relation
from app.db.base import Base


class Vehicle(Base):
    id = Column(Integer(), primary_key=True)
    driver_id = Column(ForeignKey(f"{Driver.__tablename__}.id", ondelete="CASCADE"))
    type = Column(String(1), nullable=False)
    vehicle_registration_number: Column(String(10), nullable=False)
    capacity = Column(Float(), nullable=False)

    driver = relation(Driver.__name__, back_populates=Driver.__tablename__)
