from datetime import datetime, timedelta
from time import time
from app.core.config import Setting, get_setting
from app.core.security import ALGORITHM, hash_password, verify_password
from app.repository.base import BaseRepository
from app import models, schema
from sqlalchemy.orm import Session
from fastapi import HTTPException, status
from jose import jwt

from app.utils.utils import password_reset_mail, tz_now


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
        return self.filter_by(
            db,
            phone_number=phone_number,
        ).first()

    def authenticate(self, db: Session, credentials: schema.Login) -> models.User:
        if user := self.filter_by(db, phone_number=credentials.phone_number).first():
            if verify_password(credentials.password, user.password):
                return user
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail={"message": "Invalid Login Credentials"},
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
            detail={"message": "Old password provided was not valid"},
        )

    def password_reset(
        self,
        db: Session,
        data: schema.PasswordResetInit,
        settings: Setting = get_setting(),
    ):
        if user := self.get_object_or_404(db=db, email=data.email):
            reset_token = jwt.encode(
                {
                    "id": user.id,
                    "exp": datetime.utcnow() + timedelta(minutes=15),
                },
                key=settings.SECRET_KEY,
                algorithm=ALGORITHM,
            )
            password_reset_mail(user.email, reset_token)
        return schema.MessageResponse(
            message="Password reset token has been send to your email"
        )

    def password_reset_complete(
        self,
        db: Session,
        data: schema.PasswordResetComplete,
        settings: Setting = get_setting(),
    ):
        try:
            token = jwt.decode(
                data.reset_code,
                algorithms=[ALGORITHM],
                key=settings.SECRET_KEY,
            )
        except Exception as e:
            print(e)
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail={"message": "Invalid token or the token has expired"},
            )
        if user := self.get_object_or_404(db=db, id=token["id"]):
            user.password = hash_password(data.new_password)
            db.commit()
        return schema.MessageResponse(message="Password reset successfuly")


class DriverRepository(
    BaseRepository[models.Driver, schema.DriverCreate, schema.DriverUpdate]
):
    pass


class WalletRepository(
    BaseRepository[models.Wallet, schema.Wallet, schema.PasswordUpdate]
):
    def withdraw(self, db: Session, user_id: int, amount: float):
        wallet = self.get_object_or_404(db, user_id=user_id)
        if wallet.balance > amount:
            raise HTTPException(
                status.HTTP_400_BAD_REQUEST,
                detail={
                    "message": "Your balance is not enough to complete this transaction"
                },
            )
        wallet.balance -= amount
        db.commit()
        return schema.MessageResponse("Withdrawal request has been received")


class AddressRepository(
    BaseRepository[models.Address, schema.AddressCreate, schema.AddressUpdate]
):
    pass


address_repo = AddressRepository(models.Address)
user_repo = UserRepository(models.User)
driver_repo = DriverRepository(models.Driver)
wallet_repo = WalletRepository(models.Wallet)
