from typing import Dict
from fastapi.testclient import TestClient
from app import schema
from app.core.config import Setting
from app.utils.utils import random_string


def test_user_profile(
    settings: Setting,
    client: TestClient,
    test_user_headers: Dict[str, str],
):
    res = client.get(
        f"{settings.BASE_API_URL}/account/profile/", headers=test_user_headers
    )

    assert res.status_code == 200
    assert "id" in res.json()


def test_user_profile_update(
    settings: Setting,
    client: TestClient,
    test_user_headers: Dict[str, str],
):
    profile_update_schema = schema.UserUpdate(
        is_farmer=True, last_name=random_string(15)
    )
    res = client.put(
        f"{settings.BASE_API_URL}/account/profile/",
        headers=test_user_headers,
        json=profile_update_schema.dict(),
    )
    data = res.json()

    assert res.status_code == 200
    assert data["is_farmer"] == True


def test_update_password(
    settings: Setting, test_user_headers: Dict[str, str], client: TestClient
):
    change_password = schema.PasswordUpdate(
        new_password=settings.TEST_USER_PASSWORD,
        old_password=settings.TEST_USER_PASSWORD,
    )
    res = client.post(
        f"{settings.BASE_API_URL}/account/update-password/",
        headers=test_user_headers,
        json=change_password.dict(),
    )
    assert res.status_code == 200
