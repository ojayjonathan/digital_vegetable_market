from pydantic import BaseModel


class Wallet(BaseModel):
    user_id: int
    id: int
    balance: float
    name: str

    class Config:
        orm_mode = True
