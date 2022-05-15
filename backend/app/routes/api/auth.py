from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.routes.deps import get_db
from app import schema

router = APIRouter(prefix="/auth")


@router.get("/login", response_model=schema.AccessToken)
def login(
    db: Session = Depends(get_db),
):
    ...
