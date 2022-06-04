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
async def register(db: Session = Depends(get_db), user: schema.UserCreate = Body(...)):
    if user := user_repo.create(db, user):
        return {"msg": "Account Created Successfuly!"}


# TODO: implement password reset
