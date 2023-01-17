from fastapi import APIRouter, Request, Depends, Form, Response
from fastapi.responses import HTMLResponse, RedirectResponse
from app.utils.utils import template
from sqlalchemy.orm import Session
from app.core.security import create_access_token
from app.routes.deps import get_db
from app import schema
from app.repository import user_repo

router = APIRouter(prefix="/auth")


@router.get("/login/", response_class=HTMLResponse)
def login(request: Request):
    return template.TemplateResponse("auth/login.html", {"request": request})


@router.post("/login/", response_class=HTMLResponse)
async def login(
    request: Request,
    response: Response,
    db: Session = Depends(get_db),
    phone: str = Form(...),
    password: str = Form(...),
):
    credentials = schema.Login(phone_number=phone, password=password)
    if user := user_repo.authenticate(db, credentials):
        print(user)
        token = create_access_token(user.phone_number).access_token
        response.set_cookie(
            "session",
            token,
            expires=30 * 24 * 60 * 10000,
        )

        return "<h1>Login Success Visit<a href='/admin'>Home</a></h1>"
    else:
        return template.TemplateResponse("auth/login.html", {"request": request})


@router.get("/register/", response_class=HTMLResponse)
def login(request: Request):
    return template.TemplateResponse("auth/register.html", {"request": request})

@router.get("/logout/", response_class=HTMLResponse)
def logout(request: Request):
    return RedirectResponse("/admin/auth/login",status_code=303)


@router.post("/register/", response_class=HTMLResponse)
async def register(
    response: Response,
    request: Request,
    db: Session = Depends(get_db),
    email: str = Form(...),
    last_name: str = Form(...),
    first_name: str = Form(...),
    phone: str = Form(...),
    password: str = Form(...),
):
    data = schema.UserCreate(
        email=email,
        password=password,
        first_name=first_name,
        phone_number=phone,
        last_name=last_name,
    )
    if user := user_repo.create(db, data):
        response.set_cookie("session", create_access_token(user.phone_number))
        return RedirectResponse("/admin/auth/login",status_code=303)
    else:
        return template.TemplateResponse("auth/register.html", {"request": request})
