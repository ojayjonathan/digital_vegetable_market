from datetime import datetime, timedelta
from passlib import context
from jose import jwt
from app.core.config import Setting, get_setting
from app import schema

pwd_context = context.CryptContext(schemes=["bcrypt"])
ALGORITHM = "HS256"


def create_access_token(
    subject: str,
    settings: Setting = get_setting(),
) -> schema.AccessToken:
    exp = datetime.utcnow() + timedelta(minutes=settings.ACCESS_TOKEN_EXP_MINUTES)
    token = jwt.encode(
        {
            "exp": exp,
            "sub": subject,
        },
        key=settings.SECRET_KEY,
        algorithm=ALGORITHM,
    )
    return schema.AccessToken(access_token=token)


def decode_access_token(
    token: str,
    settings: Setting = get_setting(),
) -> schema.AccessTokenData:
    try:
        payload = jwt.decode(token, settings.SECRET_KEY, algorithms=[ALGORITHM])
        print(payload)
        return schema.AccessTokenData(exp=payload["exp"], sub=payload["sub"])
    except:
        return None


def hash_password(plain_password: str) -> str:
    return pwd_context.hash(plain_password)


def verify_password(plain_password: str, hashed_password: str) -> bool:
    return pwd_context.verify(plain_password, hashed_password)
