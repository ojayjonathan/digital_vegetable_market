from fastapi import APIRouter, Depends, Body
from app import schema, models
from sqlalchemy.orm import Session
from app.routes.deps import get_db, current_user
from app.repository import FeedbackRepository

router = APIRouter(tags=["support"])


@router.post("/feedback", response_model=schema.MessageResponse)
async def feedback(
    db: Session = Depends(get_db),
    user: models.User = Depends(current_user),
    item: schema.FeedbackCreate = Body(...),
):
    repo = FeedbackRepository(models.Feedback)
    item.user_id = user.id
    if repo.create(item, db):
        return schema.MessageResponse(message="Feedback created successfuly")
