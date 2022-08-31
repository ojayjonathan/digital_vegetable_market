from datetime import datetime, date
from typing import Optional, List
from pydantic import BaseModel
from .user import User


class Product(BaseModel):
    id: int
    image_url: str
    description: Optional[str]
    owner: User
    expected_available_date: date
    measurement_unit: str
    price: float

    class Config:
        orm_mode = True


class ProductCreate(BaseModel):
    owner_id: Optional[int]
    image_url: str
    description: Optional[str]
    expected_available_date: datetime
    measurement_unit: str
    price: float
    available_quantity: float


class ProductUpdate(BaseModel):
    image_url: Optional[str]
    description: Optional[str]
    expected_available_date: Optional[date]
    measurement_unit: Optional[str]
    price: Optional[float]
    available_quantity: Optional[float]


class ProductList(BaseModel):
    products: List[Product]
    pages: Optional[int] = 1
    current_page: Optional[int] = 1
