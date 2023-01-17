from datetime import datetime
from typing import Dict
from fastapi.testclient import TestClient
from sqlalchemy.orm import Session
from app import schema
from app.core.config import Setting
from app.utils.utils import random_phone, random_string
from app import models
from app.repository import product_repo, address_repo
from fastapi.encoders import jsonable_encoder


# def test_add_product(
#     settings: Setting,
#     client: TestClient,
#     get_test_user: models.User,
#     test_user_headers: Dict[str, str],
# ):
#     address_create = schema.AddressCreate(
#         address="Home", latitude=10, longitude=10, title=random_string(10)
#     )
#     address = client.post(
#         f"{settings.BASE_API_URL}/address/",
#         headers=test_user_headers,
#         json=jsonable_encoder(address_create.dict()),
#     ).json()

#     product = schema.ProductCreate(
#         description=random_string(),
#         owner_id=get_test_user.id,
#         measurement_unit="Kg",
#         expected_available_date=datetime.now(),
#         price=18872,
#         available_quantity=100,
#         address_id=address["id"],
#         name=random_string(10),
#         category="FRUITS",
#         image="",
#         product_varieties=[]
#     )
#     data = product.dict()
#     data["category"] = "FRUITS"
#     res = client.post(
#         f"{settings.BASE_API_URL}/products/",
#         headers=test_user_headers,
#         files={
#             "image": (
#                 "test.png",
#                 open("test_image/test.png", "rb"),
#                 "image/jpeg",
#             )
#         },
#         data=data,
#     ).json()
#     assert "id" in res
#     assert "price" in res


# def test_product_list(
#     settings: Setting, client: TestClient, test_user_headers: Dict[str, str]
# ):
#     res = client.get(
#         f"{settings.BASE_API_URL}/products/",
#         headers=test_user_headers,
#     )
#     assert res.status_code == 200
#     assert isinstance(res.json()["products"], list)


# def test_update_product(
#     settings: Setting,
#     client: TestClient,
#     test_user_headers: Dict[str, str],
#     get_test_db: Session,
# ):
#     product = product_repo.query(get_test_db).first()

#     product_update_schema = schema.ProductUpdate(
#         description=random_string(),
#         measurement_unit="Kg",
#         expected_available_date=datetime.now(),
#         price=18872,
#         available_quantity=100,
#         name=random_string(10),
#     )
#     data = product_update_schema.dict()

#     res = client.post(
#         f"{settings.BASE_API_URL}/products/{product.id}/",
#         headers=test_user_headers,
#         files={
#             "image": (
#                 "test.png",
#                 open("test_image/test.png", "rb"),
#                 "image/jpeg",
#             )
#         },
#         data=data,
#     )

#     product_updated = res.json()
#     assert res.status_code == 200
#     assert product_updated["description"] in product_update_schema.description
