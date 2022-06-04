from typing import Dict
from bcrypt import re
from fastapi import status
from fastapi.testclient import TestClient
import pytest
from sqlalchemy.orm import Session
from app import schema
from app.core.config import Setting
from app.utils.utils import random_phone, random_string
from app import models


def test_register(settings: Setting, client: TestClient):
    user = schema.UserCreate(
        first_name=random_string(),
        last_name=random_string(),
        password=random_string(6),
        phone_number=random_phone(),
    )
    res = client.post(
        f"{settings.BASE_API_URL}/auth/register/",
        json=user.dict(),
    ).json()
    assert "msg" in res


def test_login(settings: Setting, client: TestClient, get_test_user: models.User):
    user_login = schema.Login(
        phone_number=settings.TEST_USER_PHONE, password=settings.TEST_USER_PASSWORD
    )
    res = client.post(
        f"{settings.BASE_API_URL}/auth/login/",
        json=user_login.dict(),
    )

    assert "access_token" in res.json()
    assert res.status_code == 200
    # invalid login credentials
    user_login_invalid = schema.Login(
        phone_number=settings.TEST_USER_PHONE, password=random_string(10)
    )
    res = client.post(
        f"{settings.BASE_API_URL}/auth/login/",
        json=user_login_invalid.dict(),
    )
    assert "access_token" not in res.json()


