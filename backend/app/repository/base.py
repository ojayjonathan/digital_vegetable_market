from typing import Optional, TypeVar, Generic, List, Type
from pydantic import BaseModel
from sqlalchemy.orm import Session, Query
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

    def delete(self, db: Session, obj: Model = None, id: int = None):
        if not obj:
            obj = self.get_object_or_404(db, id)
        try:
            db.delete(obj)
            db.commit()
            return {"msg": "Item deleted successfuly"}
        except IntegrityError as e:
            db.rollback()
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail=e.args)

    def get_object_or_404(self, db: Session, id: int) -> Model:
        if obj := self.get(db, id):
            return obj
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail={"msg": "Item not found"}
        )

    def filter_by(self, db: Session, **kwargs) -> Query:
        return db.query(self.model).filter_by(**kwargs)

    def get_all(self, db: Session) -> List[Model]:
        return db.query(self.model).all()

    def create(self, db: Session, item: CreateSchema) -> Model:
        object_in = self.model(**item.dict())
        try:
            db.add(object_in)
            db.commit()
            db.refresh(object_in)
        except IntegrityError as e:
            db.rollback()
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail=e.args)
        return object_in

    def query(self, db: Session) -> Query:
        return db.query(self.model)

    def update(self, db: Session, current_item: Model, item_in: UpdateSchema) -> Model:
        try:
            for k, v in item_in:
                if v is not None:
                    current_item.__setattr__(k, v)
            db.commit()
        except IntegrityError as e:
            db.rollback()
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail=e.args)
        return current_item
