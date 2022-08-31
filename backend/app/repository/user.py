from app.core.security import hash_password, verify_password
from app.repository.base import BaseRepository
from app import models, schema
from sqlalchemy.orm import Session
from fastapi import HTTPException, status


class UserRepository(BaseRepository[models.User, schema.UserCreate, schema.UserUpdate]):
    def create(self, db: Session, item: schema.UserCreate):
        item.password = hash_password(item.password)
        if user := super().create(db, item):
            wallet_repo.create(
                db,
                schema.WalletCreate(
                    user_id=user.id,
                    balance=0,
                    name=f"{user.first_name[0]} {user.last_name[0]}",
                ),
            )
            return user

    def get_user_by_phone(self, db: Session, phone_number: str) -> models.User:
        return self.get_object_or_404(
            db,
            phone_number=phone_number,
        )

    def authenticate(self, db: Session, credentials: schema.Login) -> models.User:
        if user := self.filter_by(db, phone_number=credentials.phone_number).first():
            if verify_password(credentials.password, user.password):
                return user
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail={"msg": "Invalid Login Credentials"},
        )

    def update_password(
        self,
        db: Session,
        user: models.User,
        data: schema.PasswordUpdate,
    ) -> models.User:
        if verify_password(data.old_password, user.password):
            user.password = hash_password(data.new_password)
            db.commit()
            return user

        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={"msg": "Old password provided was not valid"},
        )


class DriverRepository(
    BaseRepository[models.Driver, schema.DriverCreate, schema.DriverUpdate]
):
    pass


class WalletRepository(
    BaseRepository[models.Wallet, schema.Wallet, schema.PasswordUpdate]
):
    pass


user_repo = UserRepository(models.User)
driver_repo = DriverRepository(models.Driver)
wallet_repo = WalletRepository(models.Wallet)
