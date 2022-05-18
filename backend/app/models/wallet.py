from app.db.base import Base
from sqlalchemy import Column, Float, String, Integer, ForeignKey
from app.db import User


class Wallet(Base):
    id: int = Column(Integer(), primary_key=True)
    name: str = Column(String(length=30), nullable=False)
    balance: float = Column(Float(precision=2),default=0)
    user_id: int = Column(
        ForeignKey(f"{User.__tablename__}.id", ondelete="CASCADE"), unique=True
    )
