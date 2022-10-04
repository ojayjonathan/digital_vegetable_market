from pydantic import BaseModel
from typing import Optional


class Feedback(BaseModel):
    user_id: int
    message: Optional[str]
    title: Optional[str]
    id: int

    class Config:
        orm_mode = True


class FeedbackCreate(BaseModel):
    message: Optional[str]
    title: Optional[str]
    user_id:Optional[int]



