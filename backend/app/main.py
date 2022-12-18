from fastapi import FastAPI,Request
from fastapi.responses import HTMLResponse
from app.utils.utils import template
from app.routes.api.main import api_router
from app.routes.admin.admin import admin_router
from fastapi.staticfiles import StaticFiles


app = FastAPI()

app.include_router(api_router)
app.include_router(admin_router)
app.mount("/media", StaticFiles(directory="media"), name="media")
app.mount("/static", StaticFiles(directory="static"), name="static")

@app.get("/user-manual/", response_class=HTMLResponse)
def user_manual(request: Request):
    return template.TemplateResponse("UserManual.html", {"request": request})

