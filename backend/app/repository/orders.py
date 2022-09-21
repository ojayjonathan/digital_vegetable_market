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
            user_id=user_id, delivery_address_id=item.delivery_address_id
        )
        try:
            db.add(object_in)
            db.commit()
            db.refresh(object_in)
            for order_item in item.order_items:
                item = models.OrderItem(
                    order_id=object_in.id,
                    product_id=order_item.product_id,
                    quantity=order_item.quantity,
                )
                db.add(item)
            db.add(
                models.OrderDetail(
                    order_id=object_in.id,
                    message="Order created successfuly!",
                    event="CREATED",
                ),
            )
            db.commit()
            db.refresh(object_in)
        except IntegrityError as e:
            db.rollback()
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail=e.args)
        return object_in


order_repo = OrdersRepository(models.Order)
