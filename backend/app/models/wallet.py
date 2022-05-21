from app.db.base_class import Base
from sqlalchemy import Column, Float, String, Integer, ForeignKey
from .user import User


class Wallet(Base):
    name: str = Column(String(length=30), nullable=False)
    balance: float = Column(Float(precision=2), default=0)
    user_id: int = Column(
        ForeignKey(f"{User.__tablename__}.id", ondelete="CASCADE"), unique=True
    )
