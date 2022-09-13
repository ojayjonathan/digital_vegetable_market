from datetime import datetime
from app.db.base_class import Base
from sqlalchemy import Column, ForeignKey, String, Boolean, DateTime
from sqlalchemy.orm import relationship

from app.utils.utils import tz_now


class User(Base):
    first_name = Column(String(length=50), nullable=False)
    last_name = Column(String(length=50), nullable=False)
    email = Column(String(length=50))
    phone_number = Column(String(length=10), nullable=False, unique=True)
    password = Column(String(length=150))
    is_admin = Column(Boolean(), default=False, nullable=False)
    created_at = Column(DateTime(), default=tz_now(), nullable=False)
    is_farmer = Column(Boolean(), default=False, nullable=False)

    def __repr__(self) -> str:
        return f"User(first_name={self.first_name},last_name={self.last_name},phone_number={self.phone_number})"


class Driver(Base):
    user_id = Column(
        ForeignKey(f"{User.__tablename__}.id", ondelete="CASCADE"),
        nullable=False,
        unique=True,
    )
    dl = Column(String(length=20), unique=True)
    national_id = Column(String(10), unique=True)
    is_active = Column(Boolean(), default=True)

    user: User = relationship(User.__tablename__)
