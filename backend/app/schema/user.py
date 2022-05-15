from pydantic import BaseModel, Field
from typing import Optional


class User(BaseModel):
    first_name: str
    last_name: str
    id: int
    phone_number: str

    class Config:
        orm_mode = True


class UserCreate(BaseModel):
    first_name: str = Field(..., max_length=50, min_length=2)
    last_name: str = Field(..., max_length=50, min_length=2)
    phone_number: str = Field(..., regex=r"^0(7|1)\d{8}$")
    password: str = Field(..., min_length=6, max_length=30)


class UserUpdate(BaseModel):
    first_name: Optional[str] = Field(None, max_length=50, min_length=2)
    last_name: Optional[str] = Field(None, max_length=50, min_length=2)
    phone_number: Optional[str] = Field(None, regex=r"^0(7|1)\d{8}$")
