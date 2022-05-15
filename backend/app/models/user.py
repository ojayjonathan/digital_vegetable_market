from app.db.base import Base
from sqlalchemy import Column, Integer, String, Boolean


class User(Base):
    id = Column(Integer(), primary_key=True)
    first_name = Column(String(length=50), nullable=False)
    last_name = Column(String(length=50), nullable=False)
    phone_number = Column(String(length=10), nullable=False, unique=True)
    password = Column(String(length=150))
    is_admin = Column(Boolean(), default=False)
