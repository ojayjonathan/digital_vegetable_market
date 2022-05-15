from pytest import Session
from app.repository import user_repo, UserRepository
from app import schema
from app.utils.utils import random_phone, random_string
from app.core.security import  verify_password


def test_create_user(get_test_db: Session, repository: UserRepository = user_repo):
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
