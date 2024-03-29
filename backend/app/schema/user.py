from datetime import datetime
from pydantic import BaseModel, Field, EmailStr
from typing import Optional


class User(BaseModel):
    first_name: str
    last_name: str
    email: Optional[EmailStr]
    id: int
    phone_number: str
    created_at: datetime
    is_admin: bool
    is_farmer: Optional[bool] = False

    class Config:
        orm_mode = True


class UserCreate(BaseModel):
    first_name: str = Field(..., max_length=50, min_length=2)
    last_name: str = Field(..., max_length=50, min_length=2)
    phone_number: str = Field(..., regex=r"^0(7|1)\d{8}$")
    password: str = Field(..., min_length=6, max_length=30)
    is_farmer: Optional[bool] = False
    email: Optional[EmailStr]


class PasswordUpdate(BaseModel):
    old_password: str = Field(..., min_length=6, max_length=30)
    new_password: str = Field(..., min_length=6, max_length=30)


class UserUpdate(BaseModel):
    first_name: Optional[str] = Field(None, max_length=50, min_length=2)
    last_name: Optional[str] = Field(None, max_length=50, min_length=2)
    phone_number: Optional[str] = Field(None, regex=r"^0(7|1)\d{8}$")
    is_farmer: Optional[bool]
    email: Optional[EmailStr]
