from typing import Optional, TypeVar, Generic, List, Type
from pydantic import BaseModel
from sqlalchemy.orm import Session
from app.db.base import Base
from sqlalchemy.exc import IntegrityError
from fastapi import HTTPException, status

UpdateSchema = TypeVar("UpdateSchema", bound=BaseModel)
CreateSchema = TypeVar("CreateSchema", bound=BaseModel)
Model = TypeVar("Model", bound=Base)


class BaseRepository(Generic[Model, CreateSchema, UpdateSchema]):
    def __init__(self, model: Type[Model]):
        self.model = model

    def get(self, db: Session, id: int) -> Optional[Model]:
        return db.query(self.model).filter(self.model.id == id).first()

    def get_all(self, db: Session) -> List[Model]:
        return db.query(self.model).all()

    def create(self, db: Session, item: CreateSchema) -> Model:
        object_in = self.model(**item.dict())
        try:
            db.add(object_in)
            db.commit()
            db.refresh(object_in)
        except IntegrityError as e:
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail=e.args)
        return object_in

    def update(self, db: Session, item: UpdateSchema) -> Model:
        ...
