from fastapi import APIRouter
from app.routes import api

api_router = APIRouter()
api_router.include_router(api.auth.router)
