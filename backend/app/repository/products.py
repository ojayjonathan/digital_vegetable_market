from app.repository.base import BaseRepository
from app import schema, models
from sqlalchemy.orm import Session, Query
from app.db.base import Base
from sqlalchemy.exc import IntegrityError
from fastapi import HTTPException, status


class ProductsRepository(
    BaseRepository[models.Product, schema.ProductCreate, schema.ProductUpdate]
):
    def create(self, db, item: schema.ProductCreate) -> models.product:
        item = item.dict()
        item["product_varieties"] = ",".join(item.get("product_varieties")or[])
        object_in = self.model(**item)
        try:
            db.add(object_in)
            db.commit()
            db.refresh(object_in)
        except IntegrityError as e:
            db.rollback()
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail=e.args)
        return object_in


product_repo = ProductsRepository(models.Product)
