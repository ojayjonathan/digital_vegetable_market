from datetime import datetime
from pydantic import BaseModel

from app.models.payment import PaymentStatus, PaymentMode


class Payment(BaseModel):
    amount: float
    created_at: datetime
    mode: PaymentMode
    status: PaymentStatus
    id: int
    class Meta:
        orm_mode = True

class PaymentCreate(BaseModel):
    amount: float
    mode: PaymentMode
    status: PaymentStatus
