from typing import Any, Optional

from pydantic import BaseModel, Field


class AccessToken(BaseModel):
    token_type: Optional[str] = "access_token"
    access_token: str


class AccessTokenData(BaseModel):
    exp: float
    sub: Any


class Login(BaseModel):
    phone_number: str = Field(..., regex=r"^0(7|1)\d{8}$")
    password: str = Field(..., min_length=6, max_length=30)
