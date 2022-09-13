from fastapi import APIRouter, Depends, Body
from app.models import User
from app.routes.deps import current_user, get_db
from app import schema
from sqlalchemy.orm import Session
from app.repository import user_repo


router = APIRouter(prefix="/account", tags=["account"])


@router.get("/profile/", response_model=schema.User)
async def profile_me(user: User = Depends(current_user)):
    return user


@router.get("/profile/{id}", response_model=schema.User)
async def profile(id:int, db: Session = Depends(get_db), _: User = Depends(current_user)):
    return user_repo.get_object_or_404(db, id=id)


@router.put("/profile/", response_model=schema.User)
async def update_profile(
    db: Session = Depends(get_db),
    profile_update: schema.UserUpdate = Body(...),
    user: User = Depends(current_user),
):
    return user_repo.update(db, user, profile_update)


@router.post("/update-password/", response_model=schema.MessageResponse)
async def update_password(
    db: Session = Depends(get_db),
    password_update: schema.PasswordUpdate = Body(...),
    user: User = Depends(current_user),
):
    if user_repo.update_password(db, user, password_update):
        return {"message": "Password updated successfuly"}
