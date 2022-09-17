from ast import For
from datetime import datetime
import math
from typing import List, Optional
from fastapi import (
    APIRouter,
    Depends,
    Body,
    Query,
    UploadFile,
    File,
    Form,
)
from app import models, schema
from app.core.config import Setting, get_setting
from app.routes.deps import current_user, get_db
from sqlalchemy.orm import Session
from app.repository import product_repo
from app.utils.utils import upload_image

router = APIRouter(prefix="/products", tags=["product"])


@router.get("/me/", response_model=List[schema.Product])
async def products_me(
    db: Session = Depends(get_db),
    user: models.User = Depends(current_user),
):
    """
    Returns current user products
    """
    return product_repo.filter_by(db, owner_id=user.id).all()


@router.get("/", response_model=schema.ProductList)
async def products(
    page: int = Query(1, description="Current page", gt=0),
    count: int = Query(10, description="No of products per page", gt=0),
    db: Session = Depends(get_db),
    user_id: Optional[int] = Query(
        None,
        description="if specified, returns products that belong the specifed user",
    ),
):
    pages = 1
    if user_id:
        query = product_repo.filter_by(db, owner_id=user_id).all()
    else:
        query = product_repo.get_all(db)
    # pagination
    if page:
        pages = math.ceil(len(query) / count)
        if page * count <= len(query):
            query = query[count * page : count * page + count]
        else:
            query = query[len(query) - count : len(query)]
    return schema.ProductList(products=query, current_page=page, pages=pages)


@router.post("/", response_model=schema.Product)
async def add_product(
    settings: Setting = Depends(get_setting),
    user: schema.User = Depends(current_user),
    db: Session = Depends(get_db),
    image: UploadFile = File(..., description="Product thumbnail"),
    owner_id: Optional[int] = Form(None),
    description: Optional[str] = Form(...),
    expected_available_date: datetime = Form(...),
    measurement_unit: str = Form(...),
    price: float = Form(...),
    available_quantity: float = Form(...),
    address_id: int = Form(...),
    category: schema.ProductCategory = Form(...),
    name:str = Form(...),

):
    product = schema.ProductCreate(
        owner_id=owner_id if owner_id else user.id,
        description=description,
        expected_available_date=expected_available_date,
        price=price,
        address_id=address_id,
        available_quantity=available_quantity,
        measurement_unit=measurement_unit,
        image=image.filename,
        name=name,
        category=category
    )
    if product_created := product_repo.create(db, product):
        upload_image(image, f"{user.id}/{product_created.id}/", settings=settings)
        return product_created


@router.post("/{id}/", response_model=schema.Product)
async def update_product(
    id: int,
    _: schema.User = Depends(current_user),
    product_update: schema.ProductUpdate = Body(...),
    db: Session = Depends(get_db),
):
    if product := product_repo.get_object_or_404(db, id=id):
        return product_repo.update(db, product, product_update)


@router.delete("/{id}/", response_model=schema.Product)
async def delete_product(
    id: int,
    _: schema.User = Depends(current_user),
    db: Session = Depends(get_db),
):
    return product_repo.delete(db, id=id)


@router.get("/{id}", response_model=schema.Product)
async def product_details(
    id: int,
    db: Session = Depends(get_db),
    _: models.User = Depends(current_user),
):
    return product_repo.get_object_or_404(db, id=id)
