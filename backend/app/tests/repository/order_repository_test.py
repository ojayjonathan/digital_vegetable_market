from datetime import datetime
from sqlalchemy.orm import Session
from app import models, schema
from app.models.order import OrderStatus
from app.repository import product_repo, order_repo, address_repo
from app.utils.utils import random_string


def test_create_order(get_test_db: Session, get_test_user: models.User):
    address = address_repo.create(
        db=get_test_db,
        item=schema.AddressCreate(
            address="Home",
            latitude=10,
            longitude=10,
            title=random_string(10),
            user_id=get_test_user.id,
        ),
    )
    product_create = schema.ProductCreate(
        owner_id=get_test_user.id,
        price=134,
        image="/upload/product.png",
        expected_available_date=datetime.now(),
        measurement_unit="Kg",
        description="organic vegetable",
        available_quantity=100,
        address_id=address.id,
        name=random_string(10),
        category=schema.ProductCategory.FRUITS,
    )

    product = product_repo.create(get_test_db, product_create)

    order_create = schema.OrderCreate(
        order_items=[
            schema.OrderItemCreate(product_id=product.id, quantity=10),
        ],
        delivery_address_id=address.id,
    )
    order: models.Order = order_repo.create(
        db=get_test_db,
        item=order_create,
        user_id=get_test_user.id,
    )

    assert order.id
    assert order.order_items


def test_update_order(get_test_db: Session):
    order_update = schema.OrderUpdate(status=OrderStatus.DELIVERED)
    order = get_test_db.query(models.Product).first()
    order_updated = order_repo.update(get_test_db, order, order_update)
    assert order_updated.status == OrderStatus.DELIVERED


def test_delete_order(get_test_db: Session):
    order = get_test_db.query(models.Product).first()
    assert order_repo.delete(get_test_db, obj=order)
