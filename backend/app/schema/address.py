from pydantic import BaseModel, Field
from typing import Optional


class Location(BaseModel):
    id: int
    lng: Optional[float] = None
    lat: Optional[float] = None
    city: Optional[str] = None
    street: Optional[str] = None

    class Config:
        orm_mode = True


class LocationCreate(BaseModel):
    lng: Optional[float]
    lat: Optional[float] = None
    city: Optional[str] = None
    street: Optional[str] = None


class Address(BaseModel):
    location: Location
    phone_number: str
    name: str
    id: str

    class Config:
        orm_mode = True


class AddressCreate(BaseModel):
    location: LocationCreate
    phone_number: str
    name: str
