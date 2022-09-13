from datetime import datetime
from typing import Dict
from fastapi.testclient import TestClient
from sqlalchemy.orm import Session
from app import schema
from app.core.config import Setting
from app.models.order import OrderStatus
from app.utils.utils import random_phone, random_string
from app import models
from app.repository import product_repo, order_repo
from fastapi.encoders import jsonable_encoder


def test_create_order(
    settings: Setting,
    client: TestClient,
    get_test_user: models.User,
    test_user_headers: Dict[str, str],
):
    address_create = schema.AddressCreate(
        address="Home", latitude=10, longitude=10, title=random_string(10)
    )
    address = client.post(
        f"{settings.BASE_API_URL}/address/",
        headers=test_user_headers,
        json=jsonable_encoder(address_create.dict()),
    ).json()

    product = schema.ProductCreate(
        description=random_string(),
        image_url="/upload/product.png",
        owner_id=get_test_user.id,
        measurement_unit="Kg",
        expected_available_date=datetime.now(),
        price=18872,
        available_quantity=100,
        address_id=address["id"],
    )
    res = client.post(
        f"{settings.BASE_API_URL}/products/",
        headers=test_user_headers,
        json=jsonable_encoder(product.dict()),
    ).json()

    order = client.post(
        f"{settings.BASE_API_URL}/orders/",
        headers=test_user_headers,
        json=jsonable_encoder(
            {
                "order_items": [
                    schema.OrderItemCreate(product_id=res["id"], quantity=10).dict(),
                ],
                "delivery_address_id": product.address_id,
            }
        ),
    ).json()
    assert order


def test_order_list(
    settings: Setting, client: TestClient, test_user_headers: Dict[str, str]
):
    res = client.get(
        f"{settings.BASE_API_URL}/orders/",
        headers=test_user_headers,
    )
    assert res.status_code == 200
