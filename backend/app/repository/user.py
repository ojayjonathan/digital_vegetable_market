from app.core.security import hash_password
from app.repository.base import BaseRepository
from app import models, schema
from sqlalchemy.orm import Session


class UserRepository(BaseRepository[models.User, schema.UserCreate, schema.UserUpdate]):
    def create(self, db: Session, item: schema.UserCreate):
        if item.password:
            item.password = hash_password(item.password)
        return super().create(db, item)


user_repo = UserRepository(models.User)
