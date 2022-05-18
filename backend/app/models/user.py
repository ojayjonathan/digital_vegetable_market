from app.db.base import Base
from sqlalchemy import Column, ForeignKey, Integer, String, Boolean
from sqlalchemy.orm import relationship


class User(Base):
    id = Column(Integer(), primary_key=True)
    first_name = Column(String(length=50), nullable=False)
    last_name = Column(String(length=50), nullable=False)
    phone_number = Column(String(length=10), nullable=False, unique=True)
    password = Column(String(length=150))
    is_admin = Column(Boolean(), default=False)


class Driver(Base):
    user_id = Column(
        ForeignKey(f"{User.__tablename__}.id", ondelete="CASCADE"),
        nullable=False,
        unique=True,
    )
    dl = Column(String(length=20), unique=True)
    national_id = Column(String(10), unique=True)
    is_active = Column(Boolean(), default=True)

    user = relationship(User.__name__, back_populates=User.__tablename__)
