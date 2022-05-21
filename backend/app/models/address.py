from sqlalchemy import Column, Float, ForeignKey, Integer, PrimaryKeyConstraint, String
from app.db.base_class import Base
from sqlalchemy.orm import relationship

from .user import User


class Location(Base):
    lat = Column(Float(precision=5))
    lng = Column(Float(precision=5))
    street = Column(String(30))
    city = Column(String(30))


class Address(Base):
    phone_number = Column(Integer(), nullable=False)
    location_id = Column(
        ForeignKey(f"{Location.__tablename__}.id", ondelete="CASCADE"), nullable=False
    )
    name = Column(String(30), nullable=False)
    location = relationship(Location.__tablename__)
    user_id = Column(
        ForeignKey(f"{User.__tablename__}.id", ondelete="CASCADE"),
        nullable=False,
        primary_key=True,
    )

    user = relationship(User.__tablename__)

