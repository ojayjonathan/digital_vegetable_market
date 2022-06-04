from pytest import Session
import pytest
from fastapi import HTTPException
from app.repository import user_repo, UserRepository, driver_repo, DriverRepository
from app import schema
from app.utils.utils import random_phone, random_string
from app.core.security import verify_password


def test_create_user(get_test_db: Session, user_repo: UserRepository = user_repo):
    f_name = random_string()
    l_name = random_string()
    phone = random_phone()
    password = random_string(6)
    user_create = schema.UserCreate(
        first_name=f_name, last_name=l_name, phone_number=phone, password=password
    )

    user = user_repo.create(db=get_test_db, item=user_create)
    assert user
    assert user.first_name == f_name
    assert verify_password(password, user.password)


def test_list_users(get_test_db: Session, user_repo: UserRepository = user_repo):
    users = user_repo.get_all(get_test_db)
    assert users
    assert isinstance(users, list)


def test_user_update(get_test_db: Session, user_repo: UserRepository = user_repo):
    user = user_repo.get_all(get_test_db)[0]

    new_phone = random_phone()
    new_first_name = random_string(20)
    user_update = schema.UserUpdate(first_name=new_first_name, phone_number=new_phone)

    updated_user = user_repo.update(get_test_db, user, user_update)
    assert updated_user.first_name == new_first_name
    assert updated_user.phone_number == new_phone
    assert updated_user.first_name == user.first_name


def test_create_driver(
    get_test_db: Session,
    driver_repo: DriverRepository = driver_repo,
    user_repo: UserRepository = user_repo,
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

    assert driver.user
    assert driver.is_active == True
    assert driver.id
    assert driver.user.id == user.id


def test_list_drivers(
    get_test_db: Session, driver_repo: DriverRepository = driver_repo
):
    drivers = driver_repo.get_all(get_test_db)
    assert isinstance(drivers, list)


def test_driver_update(
    get_test_db: Session, driver_repo: DriverRepository = driver_repo
):
    driver = driver_repo.get_all(get_test_db)[0]

    new_dl = random_string(10)
    new_national_id = random_string(8)

    driver_update = schema.DriverUpdate(dl=new_dl, national_id=new_national_id)

    updated_driver = driver_repo.update(get_test_db, driver, driver_update)
    assert updated_driver.dl == new_dl
    assert updated_driver.national_id == new_national_id
    assert updated_driver.is_active == driver.is_active


def test_change_password(get_test_db: Session, user_repo: UserRepository = user_repo):
    password = random_string(6)
    user_create = schema.UserCreate(
        first_name=random_string(),
        last_name=random_string(),
        phone_number=random_phone(),
        password=password,
    )

    user = user_repo.create(db=get_test_db, item=user_create)
    password_update = schema.PasswordUpdate(
        old_password=password,
        new_password=random_string(7),
    )
    updated_user = user_repo.update_password(get_test_db, user, password_update)
    assert verify_password(password_update.new_password, updated_user.password)
    with pytest.raises(HTTPException):
        user_repo.update_password(get_test_db, user, password_update)
