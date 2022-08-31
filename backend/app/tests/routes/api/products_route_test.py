from datetime import datetime
from typing import Dict
from fastapi.testclient import TestClient
from sqlalchemy.orm import Session
from app import schema
from app.core.config import Setting
from app.utils.utils import random_phone, random_string
from app import models
from app.repository import product_repo
from fastapi.encoders import jsonable_encoder


def test_add_product(
    settings: Setting,
    client: TestClient,
    get_test_user: models.User,
    test_user_headers: Dict[str, str],
):
    product = schema.ProductCreate(
        description=random_string(),
        image_url="/upload/product.png",
        owner_id=get_test_user.id,
        measurement_unit="Kg",
        expected_available_date=datetime.now(),
        price=18872,
        available_quantity=100,
    )
    res = client.post(
        f"{settings.BASE_API_URL}/products/",
        headers=test_user_headers,
        json=jsonable_encoder(product.dict()),
    ).json()

    assert "id" in res
    assert "price" in res


def test_product_list(
    settings: Setting, client: TestClient, test_user_headers: Dict[str, str]
):
    res = client.get(
        f"{settings.BASE_API_URL}/products/",
        headers=test_user_headers,
    )
    assert res.status_code == 200
    assert isinstance(res.json(), list)


def test_update_product(
    settings: Setting,
    client: TestClient,
    test_user_headers: Dict[str, str],
    get_test_db: Session,
):
    product_update_schema = schema.ProductUpdate(
        description=random_string(),
        image_url="/upload/product.png",
        measurement_unit="Kg",
        expected_available_date=datetime.now(),
        price=18872,
        available_quantity=100,
    )
    product = product_repo.query(get_test_db).first()

    res = client.post(
        f"{settings.BASE_API_URL}/products/{product.id}/",
        headers=test_user_headers,
        json=jsonable_encoder(product_update_schema.dict()),
    )

    product_updated = res.json()

    assert res.status_code == 200
    assert product_updated["description"] in product_update_schema.description
