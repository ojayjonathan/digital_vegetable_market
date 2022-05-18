from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, Session
from app.db import Base
from app.core.config import Setting, get_setting
from app import schema
from app.models import User
from app.core.security import hash_password


TEST_DB_URL = "sqlite:///./test.db"

engine = create_engine(TEST_DB_URL, connect_args={"check_same_thread": False})
TestingSessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)


def init_test_db(settings: Setting = get_setting()):
    Base.metadata.create_all(bind=engine)
    db: Session = TestingSessionLocal()

    if not db.query(User).filter(User.phone_number == settings.TEST_USER_PHONE).first():
        # create test user

        user = User(
            first_name="test",
            last_name="user",
            password=hash_password(settings.TEST_USER_PASSWORD),
            is_admin=True,
            phone_number=settings.TEST_USER_PHONE,
        )
        db.add(user)
        db.commit()
