from app.core.config import get_setting
from sqlalchemy.orm import Session
from app.db.db import SessionLocal
from typing import Generator


def get_current_user(db: Session, settings=get_setting()):
    ...


def get_db() -> Generator:
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
