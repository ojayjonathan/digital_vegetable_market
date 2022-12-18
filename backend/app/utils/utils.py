from datetime import datetime
from random import randint
from string import ascii_lowercase
from fastapi import UploadFile, Depends
import os
import shutil
from typing import Any
from mako.template import Template
from mako.lookup import TemplateLookup
from fastapi.templating import Jinja2Templates
from app.core.config import get_setting
from jinja2.ext import Extension
from jinja2 import Environment
import json


def random_string(len=10) -> str:
    return "".join([ascii_lowercase[randint(0, 25)] for _ in range(len)])


def random_phone() -> str:
    return "".join(["07", *[str(randint(0, 9)) for _ in range(8)]])


def tz_now() -> datetime:
    return datetime.utcnow() + get_setting().UTC_TIME_DELTA_OFFSET


def password_reset_mail(email: str, token: str):
    print(token, email)


def upload_image(file: UploadFile, media_url="", settings=get_setting()):
    url = settings.MEDIA_URL + media_url
    if not os.path.exists(url):
        os.makedirs(url)
    with open(url + file.filename, "wb") as img:
        shutil.copyfileobj(file.file, img)


def date_format(value: datetime) -> str:
    return value.strftime("%d %b, %Y  %X")


environment = TemplateLookup(directories=["app/templates"])


template = Jinja2Templates(directory="templates")
template.env.filters["jsonify"] = json.dumps
template.env.filters["capfirst"] = lambda x: str(x).capitalize()


def render_template(path, context={}):
    template = environment.get_template(path)
    return template.render(**context)
