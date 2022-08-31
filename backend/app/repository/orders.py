from app.repository.base import BaseRepository
from app import schema, models
from sqlalchemy.orm import Session
from sqlalchemy.exc import IntegrityError
from fastapi import HTTPException, status


class OrdersRepository(
    BaseRepository[models.Order, schema.OrderCreate, schema.OrderItemUpdate]
):
    def create(
        self, db: Session, item: schema.OrderCreate, user_id: int
    ) -> models.Order:
        object_in = models.Order(
            created_at=item.created_at,
            user_id=user_id,
            status=item.status,
            type=item.type,
            pick_up_date=item.pick_up_date,
        )
        try:
            db.add(object_in)
            for order_item in item.orders_items:
                db.add(models.OrderItem(**order_item, order_id=object_in.user_id))
            db.commit()
            db.refresh(object_in)
        except IntegrityError as e:
            db.rollback()
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail=e.args)
        return super().create(db, item)


order_repo = OrdersRepository(models.Order)
