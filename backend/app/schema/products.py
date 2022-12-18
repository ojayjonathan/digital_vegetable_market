from datetime import datetime, date
from enum import Enum
from typing import Any, Optional, List
from pydantic import BaseModel
from app.models.product import ProductCategory
from app.schema.address import Address
from .user import User


class Product(BaseModel):
    id: int
    image_url: str
    description: Optional[str]
    owner: User
    expected_available_date: date
    measurement_unit: str
    price: float
    name: str
    category: ProductCategory
    address: Address
    available_quantity: float
    varieties: Optional[List[str]]





    class Config:
        orm_mode = True


class ProductCreate(BaseModel):
    owner_id: int
    image: str
    name: str
    description: Optional[str]
    expected_available_date: datetime
    measurement_unit: str
    price: float
    available_quantity: float
    address_id: int
    category: ProductCategory
    product_varieties: Optional[List[str]]=None


class ProductUpdate(BaseModel):
    image: Optional[str]
    description: Optional[str]
    expected_available_date: Optional[datetime]
    measurement_unit: Optional[str]
    price: Optional[float]
    available_quantity: Optional[float]
    name: Optional[str]
    category: Optional[ProductCategory]
    product_varieties: Optional[List[str]]




class ProductList(BaseModel):
    products: List[Product]
    pages: Optional[int] = 1
    current_page: Optional[int] = 1
