from pydantic import BaseModel, Field
from app import schema
from typing import Optional


class Driver(BaseModel):
    user: schema.User
    id: int
    dl: str
    national_id: str
    is_active: bool

    class Config:
        orm_mode = True


class DriverCreate(BaseModel):
    user_id: int
    dl: str
    national_id: str = Field(..., max_length=10, min_length=7)
    is_active: Optional[bool] = True


class DriverUpdate(BaseModel):
    user_id: Optional[int]
    dl: Optional[str]
    national_id: Optional[str] = Field(..., max_length=10, min_length=7)
    is_active: Optional[bool]
