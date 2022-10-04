from fastapi import FastAPI
from app.routes.api.main import api_router
from fastapi.staticfiles import StaticFiles


app = FastAPI()
app.include_router(api_router)
app.mount("/media", StaticFiles(directory="media"), name="media")
app.mount("/static", StaticFiles(directory="static"), name="static")

