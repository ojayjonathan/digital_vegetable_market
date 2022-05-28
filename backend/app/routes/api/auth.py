from fastapi import APIRouter, Body, Depends, status
from sqlalchemy.orm import Session
from app.core.security import create_access_token
from app.routes.deps import get_current_user, get_db
from app import schema
from app import models
from app.repository import user_repo

router = APIRouter(prefix="/auth")


@router.post("/login/", response_model=schema.AccessToken)
async def login(db: Session = Depends(get_db), credentials: schema.Login = Body(...)):
    if user := user_repo.authenticate(db, credentials):
        return create_access_token(user.phone_number)


@router.post("/register/")
async def register(db: Session = Depends(get_db), user: schema.UserCreate = Body(...)):
    user_repo.create(db, user)
    return {"msg": "Account Created Successfuly!"}


@router.post("/change-password/")
async def change_password(
    db: Session = Depends(get_db),
    user: models.User = Depends(get_current_user),
    data: schema.ChangePassword = Body(...),
):
    print(user)
    return user_repo.update_password(db, user, data)


