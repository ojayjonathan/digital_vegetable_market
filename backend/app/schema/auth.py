from typing import Any, Optional

from pydantic import BaseModel, Field, validator


class AccessToken(BaseModel):
    type: Optional[str] = "Bearer"
    access_token: str


class AccessTokenData(BaseModel):
    exp: float
    sub: Any


class Login(BaseModel):
    phone_number: str = Field(..., regex=r"^0(7|1)\d{8}$")
    password: str = Field(..., min_length=6, max_length=30)


class PasswordResetInit(BaseModel):
    email: str


class PasswordResetComplete(BaseModel):
    reset_code: str
    new_password: str = Field(..., min_length=6, max_length=30)
