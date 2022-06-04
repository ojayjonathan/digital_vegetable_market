from app import schema
from app.repository import (
    DriverRepository,
    UserRepository,
    driver_repo,
    user_repo,
    vehicle_repo,
    VehicleRepository,
)
from sqlalchemy.orm import Session

from app.utils.utils import random_phone, random_string


def test_create_driver(
    get_test_db: Session,
    driver_repo: DriverRepository = driver_repo,
    user_repo: UserRepository = user_repo,
    vehicle_repo: VehicleRepository = vehicle_repo,
):
    f_name = random_string()
    l_name = random_string()
    phone = random_phone()
    password = random_string(6)
    user_create = schema.UserCreate(
        first_name=f_name, last_name=l_name, phone_number=phone, password=password
    )

    user = user_repo.create(db=get_test_db, item=user_create)
    driver_create = schema.DriverCreate(
        user_id=user.id, dl=random_string(10), national_id=random_string(8)
    )
    driver = driver_repo.create(db=get_test_db, item=driver_create)

    vehicle_create = schema.VehicleCreate(
        type=schema.VehicleType.Lorry,
        driver_id=driver.id,
        registration_number=random_string(10),
        capacity=100000,
    )
    vehicle = vehicle_repo.create(get_test_db, vehicle_create)
    assert vehicle
    assert vehicle.driver == driver
    assert vehicle.driver.user
