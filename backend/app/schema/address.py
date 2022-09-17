from pydantic import BaseModel, Field
from typing import Optional


class Address(BaseModel):
    user_id: int
    latitude: float
    longitude: float
    address: Optional[str]
    title: str
    id: int

    class Config:
        orm_mode = True


class AddressCreate(BaseModel):
    latitude: float
    longitude: float
    address: Optional[str]
    title: str
    user_id: Optional[int]


class AddressUpdate(BaseModel):
    latitude: Optional[float]
    longitude: Optional[float]
    address: Optional[str]
    title: Optional[str]
