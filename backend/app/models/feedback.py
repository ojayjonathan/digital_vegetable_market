from sqlalchemy import Column, ForeignKey, String
from .user import User
from app.db.base_class import Base


class Feedback(Base):
    user_id = Column(
        ForeignKey(f"{User.__tablename__}.id", ondelete="CASCADE"),
        nullable=False,
    )
    message = Column(String(1000))
    subject = Column(String(50))
