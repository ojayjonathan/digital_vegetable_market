# content of conftest.py
import pytest
from fastapi.testclient import TestClient


from app.routes.deps import get_db
from app.main import app
from app.tests.db_session import TestingSessionLocal, init_test_db

init_test_db()


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


@pytest.fixture(scope="session")
def get_test_db():
    try:
        db = TestingSessionLocal()
        yield db
    finally:
        db.close()
