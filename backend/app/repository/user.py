from app.core.security import hash_password, verify_password
from app.repository.base import BaseRepository
from app import models, schema
from sqlalchemy.orm import Session
from fastapi import HTTPException, status


class UserRepository(BaseRepository[models.User, schema.UserCreate, schema.UserUpdate]):
    def create(self, db: Session, item: schema.UserCreate):
        if item.password:
            item.password = hash_password(item.password)
        return super().create(db, item)

    def get_user_by_phone(self, db: Session, phone_number: str) -> models.User:
        print(phone_number)
        return (
            db.query(self.model)
            .filter(self.model.phone_number == phone_number)
            .first()
        )

    def authenticate(self, db: Session, credentials: schema.Login) -> models.User:
        if user := self.get_user_by_phone(db, credentials.phone_number):
            if verify_password(credentials.password, user.password):
                return user
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail={"msg": "Invalid Login Credentials"},
        )


class DriverRepository(
    BaseRepository[models.Driver, schema.DriverCreate, schema.DriverUpdate]
):
    pass


user_repo = UserRepository(models.User)
driver_repo = DriverRepository(models.Driver)
