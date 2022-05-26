from fastapi import Depends, HTTPException, status, Security
from app.core.config import Setting, get_setting
from sqlalchemy.orm import Session
from fastapi.security import HTTPBearer, HTTPBasicCredentials
from app.core.security import decode_access_token
from app.db.db import SessionLocal
from typing import Generator
from app.repository import user_repo
from app import models

auth_token_bearer = HTTPBearer()


def get_db() -> Generator:
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


def get_current_user(
    credentials: HTTPBasicCredentials = Security(auth_token_bearer),
    db: Session = Depends(get_db),
    settings: Setting = Depends(get_setting),
) -> models.User:
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )
    if access_token := decode_access_token(credentials.credentials, settings=settings):
        if user := user_repo.get_user_by_phone(db=db, phone_number=access_token.sub):
            return user
    raise credentials_exception
