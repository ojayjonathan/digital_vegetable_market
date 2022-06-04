from pydantic import BaseModel, Field
from typing import Optional


class Wallet(BaseModel):
    user_id: int
    id: int
    balance: float
    name: str

    class Config:
        orm_mode = True


class WalletCreate(BaseModel):
    user_id: int
    balance: Optional[float] = Field(0, gt=-1)
    name: str

    class Config:
        orm_mode = True


class WalletUpdate(BaseModel):
    balance: float = Field(..., gt=-1)
