from ctypes import Union
import math
from typing import List, Optional
from fastapi import APIRouter, Depends, Body, HTTPException, Query
from app import models, schema
from app.routes.deps import current_user, get_db
from sqlalchemy.orm import Session
from app.repository import product_repo

router = APIRouter(prefix="/products", tags=["product"])


@router.get("/me/", response_model=List[schema.Product])
async def products_me(
    db: Session = Depends(get_db),
    user: models.User = Depends(current_user),
):
    return product_repo.filter_by(db, owner_id=user.id).all()


@router.get("/list/", response_model=schema.ProductList)
async def products(
    page: int  = Query(1, description="Current page", gt=0),
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
    print(query)
    return schema.ProductList(products=query, current_page=page, pages=pages)


@router.post("/add/", response_model=schema.Product)
async def add_product(
    user: schema.User = Depends(current_user),
    product: schema.ProductCreate = Body(...),
    db: Session = Depends(get_db),
):
    if not product.owner_id:
        product.owner_id = user.id
    if product_created := product_repo.create(db, product):
        return product_created


@router.post("/update/{id}/", response_model=schema.Product)
async def update_product(
    id: int,
    user: schema.User = Depends(current_user),
    product_update: schema.ProductCreate = Body(...),
    db: Session = Depends(get_db),
):
    if product := product_repo.get_object_or_404(db, id):
        updated_product = product_repo.update(db, product, product_update)
        return updated_product


@router.delete("/{id}/", response_model=schema.MessageResponse)
async def delete_product(
    id: int,
    user: schema.User = Depends(current_user),
    db: Session = Depends(get_db),
):
    if product := product_repo.filter_by(db, owner_id=user.id, id=id).first():
        message = product_repo.delete(db, product)
        return message
    raise HTTPException(status_code=404, detail={"msg": "Item to found"})
