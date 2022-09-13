# content of conftest.py
from typing import Dict
import pytest
from fastapi.testclient import TestClient
from sqlalchemy.orm import Session
from app.core.security import create_access_token, hash_password
from app.models import User
from app.routes.deps import get_db
from app.main import app
from app.tests.db_session import TestingSessionLocal, engine
from app.core.config import Setting, get_setting
from app.db.base import Base
from app import schema
from app.repository import user_repo

Base.metadata.create_all(bind=engine)


def get_db_override():
    try:
        db = TestingSessionLocal()
        yield db
    finally:
        db.close()


app.dependency_overrides[get_db] = get_db_override


@pytest.fixture(scope="module")
def client():
    with TestClient(app) as c:
        yield c


@pytest.fixture(scope="module")
def settings() -> Setting:
    yield get_setting()


@pytest.fixture(scope="session")
def get_test_db():
    try:
        db = TestingSessionLocal()
        yield db
    finally:
        db.close()


@pytest.fixture(scope="module")
def test_user_headers(settings: Setting) -> Dict:
    access_token = create_access_token(settings.TEST_USER_PHONE).access_token
    return {
        "Authorization": f"Bearer {access_token}",
    }


@pytest.fixture(scope="module")
def get_test_user(get_test_db: Session, settings: Setting = get_setting()):
    test_user = (
        get_test_db.query(User)
        .filter(User.phone_number == settings.TEST_USER_PHONE)
        .first()
    )
    if not test_user:
        # create test user
        test_user = User(
            first_name="test",
            last_name="user",
            password=hash_password(settings.TEST_USER_PASSWORD),
            is_admin=True,
            phone_number=settings.TEST_USER_PHONE,
            email = settings.TEST_USER_EMAIL
        )
        get_test_db.add(test_user)
        get_test_db.commit()
    yield test_user
