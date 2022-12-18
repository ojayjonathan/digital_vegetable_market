from datetime import date, datetime
from json import dumps
from typing import Any, Callable, Coroutine, Optional, List
from fastapi.routing import APIRoute
from fastapi import (
    APIRouter,
    Request,
    Response,
    UploadFile,
    File,
    Depends,
    HTTPException,
    Query,
    Form,
)
from fastapi.responses import HTMLResponse, RedirectResponse
from app import schema, models
from sqlalchemy.orm import Session
from app.core.config import Setting, get_setting
from app.utils.utils import template, upload_image
from app.routes.deps import current_user, get_db, admin_user
from .auth import router
from app.repository import product_repo, order_repo, user_repo


class AdminRouterHandler(APIRoute):
    def get_route_handler(self) -> Callable[[Request], Coroutine[Any, Any, Response]]:
        super_hander = super().get_route_handler()

        async def authentication_error_hander(request: Request) -> Response:
            try:
                return await super_hander(request)
            except HTTPException as e:
                if e.status_code == 401 or e.status_code == 403:
                    return RedirectResponse("/admin/auth/login/", 303)
                raise e
            except Exception as e:
                raise e

        return authentication_error_hander


admin_router = APIRouter(
    prefix="/admin", route_class=AdminRouterHandler, tags=["Admin"]
)
admin_router.include_router(router)


@admin_router.get("/", response_class=HTMLResponse)
def admin(
    request: Request,
    user: schema.User = Depends(admin_user),
    db: Session = Depends(get_db),
    freq: Optional[schema.SalesFreq] = Query("day"),
    from_: Optional[str] = Query(None),
    to: Optional[str] = Query(datetime.now().strftime("%Y-%m-%d")),
):
    vendor = user
    # total incoming orders for this vendor
    orders: list[models.Order] = order_repo.get_all(db=db)
    total_orders = len(orders)

    # pending orders
    pending = len(
        [order for order in orders if order.status == models.OrderStatus.PENDING]
    )

    # total unique customers for this vendor
    total_customers = len(user_repo.get_all(db=db))

    # Total earnings
    sales_total = sum(
        [
            order.total
            for order in orders
            if order.status == models.OrderStatus.DELIVERED
        ]
    )

    # products by number of orders made
    top_selling_products = product_repo.get_all(db=db)

    # order stats count
    order_stats = order_repo.order_stats(db=db)

    # daily sales total
    daily_sales = order_repo.daily_sales_totals(db=db, from_=from_, to=to, freq=freq)

    return template.TemplateResponse(
        "dashboard/analytics.html",
        {
            "request": request,
            "total_orders": total_orders,
            "total_customers": total_customers,
            "sales_total": sales_total,
            "pending_orders": pending,
            "top_selling": top_selling_products,
            "order_stats": order_stats,
            "daily_totals": daily_sales,
            "vendor": vendor,
            "to": to,
            "freq": freq,
            "from_": from_,
        },
    )


@admin_router.get("/orders/", response_class=HTMLResponse)
def orders(
    request: Request,
    user: schema.User = Depends(admin_user),
    db: Session = Depends(get_db),
    status: Optional[models.OrderStatus] = Query(None),
    owner_id: Optional[int] = Query(None),
):

    orders = order_repo.filter_by(db=db, user_id=owner_id, status=status)
    return template.TemplateResponse(
        "dashboard/orders.html",
        {
            "request": request,
            "orders": orders,
            "display_type": (status or "All").lower().capitalize(),
        },
    )


@admin_router.get("/orders/{id}", response_class=HTMLResponse)
def order_details(
    id: int,
    request: Request,
    user: schema.User = Depends(admin_user),
    db: Session = Depends(get_db),
):

    order = order_repo.get_object_or_404(db=db, id=id)
    return template.TemplateResponse(
        "dashboard/order_detail.html",
        {"request": request, "order": order, "user": user},
    )


@admin_router.post("/orders/{id}", response_class=HTMLResponse)
async def order_details(
    id: int,
    request: Request,
    user: schema.User = Depends(admin_user),
    db: Session = Depends(get_db),
):

    order = order_repo.get_object_or_404(db=db, id=id)
    form = await request.form()

    order_items: list[schema.OrderItemUpdate] = []
    for k, v in form.items():
        if k.isdigit():
            order_items.append(schema.OrderItemUpdate(quantity=v, id=k))

    order_update = schema.OrderUpdate(
        status=form.get("status"), order_items=order_items
    )
    order = order_repo.update(db, order, order_update)

    return template.TemplateResponse(
        "dashboard/order_detail.html",
        {"request": request, "order": order, "user": user},
    )


@admin_router.get("/products/", response_class=HTMLResponse)
def products(
    request: Request,
    _: schema.User = Depends(admin_user),
    db: Session = Depends(get_db),
):

    products = product_repo.get_all(db=db)
    return template.TemplateResponse(
        "dashboard/products.html",
        {"request": request, "products": products},
    )


@admin_router.get("/products/{id}", response_class=HTMLResponse)
def product_update(
    id: int,
    request: Request,
    _: schema.User = Depends(admin_user),
    db: Session = Depends(get_db),
):
    product = product_repo.get_object_or_404(db, id=id)
    return template.TemplateResponse(
        "dashboard/products_edit.html",
        {
            "request": request,
            "product": product,
            "categories": ["FRUITS", "VEGETABLES"],
        },
    )


@admin_router.post("/products/{id}", response_class=HTMLResponse)
async def product_update(
    id: int,
    request: Request,
    _: schema.User = Depends(admin_user),
    db: Session = Depends(get_db),
    image: Optional[UploadFile] = File(None, description="Product thumbnail"),
    description: Optional[str] = Form(None),
    expected_available_date: Optional[datetime] = Form(None),
    measurement_unit: Optional[str] = Form(None),
    price: Optional[float] = Form(None),
    available_quantity: Optional[float] = Form(None),
    category: Optional[schema.ProductCategory] = Form(None),
    name: Optional[str] = Form(None),
    settings: Setting = Depends(get_setting),
):
    product_update = schema.ProductUpdate(
        available_quantity=available_quantity,
        category=category,
        description=description,
        expected_available_date=expected_available_date,
        measurement_unit=measurement_unit,
        price=price,
        name=name,
    )
    if image:
        if not image.filename:
            image.filename = "image.jpg"
        product_update.image = image.filename
    if product := product_repo.get_object_or_404(db, id=id):
        product_repo.update(db=db, current_item=product, item_in=product_update)
        if image.file:
            upload_image(
                image, f"{product.owner_id}/products/{product.id}/", settings=settings
            )
        return RedirectResponse("/admin/products/", status_code=303)
    return template.TemplateResponse(
        "dashboard/products_edit.html",
        {
            "request": request,
            "product": product,
            "categories": ["FRUITS", "VEGETABLES"],
        },
    )
