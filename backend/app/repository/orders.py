from datetime import date, datetime, timezone, timedelta
from app.repository.base import BaseRepository
from app import schema, models
from sqlalchemy.orm import Session, Query
from sqlalchemy.exc import IntegrityError
from fastapi import HTTPException, status
from app.utils.utils import tz_now
from typing import Optional

from sqlalchemy import func


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

    def update(
        self, db: Session, current_item: models.Order, item_in: schema.OrderUpdate
    ) -> models.Order:
        try:
            for order_item in item_in.order_items:
                item = db.query(models.OrderItem).get(order_item.id)
                for k, v in order_item:
                    if v is not None:
                        item.__setattr__(k, v)
            for k, v in item_in:
                if v is not None and k != "order_items":
                    current_item.__setattr__(k, v)
                db.commit()
                db.refresh(current_item)
            db.add(
                models.OrderDetail(
                    order_id=current_item.id,
                    message="Order updated successfuly!",
                    event=item_in.status or "UPDATED",
                ),
            )
        except IntegrityError as e:
            db.rollback()
            raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.args)
        return current_item

    def order_stats(self, db: Session, **kwags):
        orders: list[models.Order] = self.filter_by(db=db, **kwags)
        # order stats count
        delivered = len(
            [item for item in orders if item.status == models.OrderStatus.DELIVERED]
        )
        on_transit = len(
            [item for item in orders if item.status == models.OrderStatus.ACTIVE]
        )
        pending = len(
            [item for item in orders if item.status == models.OrderStatus.PENDING]
        )
        cancelled = len(
            [item for item in orders if item.status == models.OrderStatus.CANCELLED]
        )

        if delivered == on_transit == pending == cancelled == 0:
            delivered = 1
            on_transit = 1
            pending = 1
            cancelled = 1

        order_stats = [
            ["Status", "Order count"],
            ["Delivered", delivered],
            ["Active", on_transit],
            ["Cancelled", cancelled],
            ["Pending", pending],
        ]

        return order_stats

    def daily_sales_totals(
        self,
        db: Session,
        from_: Optional[str] = None,
        to: Optional[str] = None,
        freq="day",
        **kwags,
    ):
        query = db.query(
            func.date_trunc(freq, models.Order.created_at).label("date"),
            models.Order.id
            # func.sum(models.Order.total).label("total_sales"),
        )

        if from_:
            from_ = datetime.strptime(from_, "%Y-%m-%d")

        else:
            if freq.upper() == "week":
                from_ = datetime.now() - timedelta(weeks=10)

            elif freq.upper() == "month":
                from_ = datetime.now() - timedelta(days=30 * 10)
            elif freq.upper() == "year":
                from_ = datetime.now() - timedelta(days=365 * 10)
            else:
                from_ = datetime.now() - timedelta(days=100)
        if to:
            to = datetime.strptime(to, "%Y-%m-%d")
        else:
            to = tz_now()
        query = query.filter(
            models.Order.created_at >= from_,
            models.Order.created_at < to
        )

        date_totals = {}
        for order in query:
            sale_date = format_date(freq, order.date)

            total = self.get(db, order.id).total

            if sale_date in date_totals:
                date_totals[sale_date] += total
            else:
                date_totals[sale_date] = total

        data = [["Date", "Sales total"]]
        x = [[k, v] for k, v in date_totals.items()]

        if len(x) < 10:
            x += [
                [
                    format_date(
                        freq, datetime.now() - timedelta(days=(i + 1) * get_days(freq))
                    ),
                    0,
                ]
                for i in range((10 - len(x)))
            ]

        x.sort(key=lambda n: n[0])
        return data + x


def get_days(freq):
    if freq == "week":
        return 7
    if freq == "year":
        return 365
    if freq == "month":
        return 30
    else:
        return 1


def format_date(freq, date: datetime):
    if freq == "year":
        return date.strftime("%Y")
    if freq == "month":
        return date.strftime("%Y-%m")
    else:
        return date.strftime("%Y-%m-%d")


order_repo = OrdersRepository(models.Order)
