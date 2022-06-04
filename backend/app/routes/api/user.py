from fastapi import APIRouter, Depends, Body
from app.models import User
from app.routes.deps import get_current_user, get_db
from app import schema
from sqlalchemy.orm import Session
from app.repository import user_repo


router = APIRouter(prefix="/account", tags=["profile"])


@router.get("/profile/", response_model=schema.User)
async def profile(user: User = Depends(get_current_user)):
    return user


@router.post("/profile/", response_model=schema.User)
async def update_profile(
    db: Session = Depends(get_db),
    profile_update: schema.UserUpdate = Body(...),
    user: User = Depends(get_current_user),
):
    if user := user_repo.update(db, user, profile_update):
        return user


@router.post("/update-password/", response_model=schema.MessageResponse)
async def update_password(
    db: Session = Depends(get_db),
    password_update: schema.PasswordUpdate = Body(...),
    user: User = Depends(get_current_user),
):
    if user_repo.update_password(db, user, password_update):
        return {"msg": "Password updated successfuly"}
