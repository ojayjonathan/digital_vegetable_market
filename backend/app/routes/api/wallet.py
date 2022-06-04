from fastapi import APIRouter, Depends
from app import schema, models
from app.routes.deps import get_current_user, get_db
from app.repository import wallet_repo
from sqlalchemy.orm import Session

router = APIRouter(prefix="/wallet", tags=["wallet"])


@router.get("/", response_model=schema.Wallet)
async def wallet(
    db: Session = Depends(get_db), user: models.User = Depends(get_current_user)
):
    return wallet_repo.filter_by(db, user_id=user.id).first()
