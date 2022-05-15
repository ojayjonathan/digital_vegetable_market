from fastapi import FastAPI
from app.routes.api.main import api_router



app = FastAPI()
app.include_router(api_router)