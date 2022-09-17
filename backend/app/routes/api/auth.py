from fastapi import APIRouter, Body, Depends
from sqlalchemy.orm import Session
from app.core.security import create_access_token
from app.routes.deps import get_db
from app import schema
from app.repository import user_repo

router = APIRouter(prefix="/auth", tags=["auth"])


@router.post("/login/", response_model=schema.AccessToken)
async def login(db: Session = Depends(get_db), credentials: schema.Login = Body(...)):
    if user := user_repo.authenticate(db, credentials):
        return create_access_token(user.phone_number)


@router.post("/register/", response_model=schema.MessageResponse)
async def register(db: Session = Depends(get_db), data: schema.UserCreate = Body(...)):
    if user := user_repo.create(db, data):
        return {"message": "Account Created Successfuly!"}


@router.post("/password-reset-init/", response_model=schema.MessageResponse)
async def password_reset_init(
    db: Session = Depends(get_db), data: schema.PasswordResetInit = Body(...)
):
    return user_repo.password_reset(db, data)


@router.post("/password-reset-complete/", response_model=schema.MessageResponse)
async def password_reset_complete(
    db: Session = Depends(get_db), data: schema.PasswordResetComplete = Body(...)
):
    return user_repo.password_reset_complete(db, data)
