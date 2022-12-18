from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse, JSONResponse
from app.utils.utils import template
from app.routes.api.main import api_router
from app.routes.admin.admin import admin_router
from fastapi.staticfiles import StaticFiles
from fastapi import FastAPI, HTTPException
from fastapi.exceptions import RequestValidationError


app = FastAPI()


@app.exception_handler(RequestValidationError)
async def validation_exception_handler(
    request,
    exc: RequestValidationError,
):
    errors = {}
    for e in exc.errors():
        errors[e["loc"][-1]] = {"message": e["msg"], "msg": e["msg"], "type": e["type"]}

    return JSONResponse(
        {"detail": errors, "message": "Validation Error"}, status_code=422
    )


@app.get("/user-manual/", response_class=HTMLResponse)
def user_manual(request: Request):
    return template.TemplateResponse("UserManual.html", {"request": request})


app.include_router(api_router)
app.include_router(admin_router)
app.mount("/media", StaticFiles(directory="media"), name="media")
app.mount("/static", StaticFiles(directory="static"), name="static")
