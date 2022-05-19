from enum import Enum
from pydantic import BaseModel
from typing import Optional
from app import schema


class VehicleType(str, Enum):

    Lorry = "L"
    Pickup = "P"
    MotorBike = "B"


class Vehicle(BaseModel):
    id: int
    type: VehicleType
    registration_number: str
    driver: Optional[schema.Driver]
    capacity: float

    class Config:
        orm_mode = True


class VehicleCreate(BaseModel):
    type: VehicleType
    registration_number: str
    driver_id: int
    capacity: float


class VehicleUpdate(BaseModel):
    type: Optional[VehicleType]
    registration_number: Optional[str]
    driver_id: Optional[int]
    capacity: Optional[float]
