from datetime import datetime, timedelta
from passlib import context
from jose import jwt
from app.core.config import get_setting
from app import schema

pwd_context = context.CryptContext(schemes=["bcrypt"])


def create_access_token(
    subject: str,
    settings=get_setting(),
) -> schema.AccessToken:
    exp = datetime.utcnow() + timedelta(minutes=settings.ACCESS_TOKEN_EXP_MINUTES)
    token = jwt.encode(
        {
            "exp": exp,
            "sub": subject,
        },
        key=settings.SECRET_KEY,
    )
    return schema.AccessToken(access_token=token)


def hash_password(plain_password: str) -> str:
    return pwd_context.hash(plain_password)


def verify_password(plain_password: str, hashed_password: str) -> bool:
    return pwd_context.verify(plain_password, hashed_password)
