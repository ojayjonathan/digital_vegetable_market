from datetime import datetime
from app import schema, models
from sqlalchemy.orm import Session
from app.repository import product_repo, address_repo
from app.schema.address import AddressCreate


def test_create_product(get_test_db: Session, get_test_user: models.User):
    address = address_repo.create(
        get_test_db,
        schema.AddressCreate(
            address="Home",
            latitude=10,
            longitude=10,
            title="Home Location",
            user_id=get_test_user.id,
        ),
    )
    product_create = schema.ProductCreate(
        owner_id=get_test_user.id,
        price=134,
        image_url="/upload/product.png",
        expected_available_date=datetime.now(),
        measurement_unit="Kg",
        description="organic vegetable",
        available_quantity=100,
        address_id=address.id,
    )

    product = product_repo.create(get_test_db, product_create)
    assert product.id
    assert product.description
    assert product.owner
    assert product.image_url


def test_update_product(get_test_db: Session):
    product_update = schema.ProductUpdate(
        price=1234,
        expected_available_date=datetime.now(),
    )
    product = get_test_db.query(models.Product).first()

    product_updated = product_repo.update(get_test_db, product, product_update)

    assert product_updated.id == product.id
    assert product_updated.price == product_update.price
