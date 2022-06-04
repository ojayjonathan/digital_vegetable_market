from typing import List, Optional
from fastapi import APIRouter, Depends, Body, HTTPException, Query
from app import schema
from app.routes.deps import get_current_user, get_db
from sqlalchemy.orm import Session
from app.repository import product_repo

router = APIRouter(prefix="/products", tags=["product"])


@router.post("/add/", response_model=schema.Product)
async def add_product(
    user: schema.User = Depends(get_current_user),
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
    user: schema.User = Depends(get_current_user),
    product_update: schema.ProductCreate = Body(...),
    db: Session = Depends(get_db),
):
    if product := product_repo.get_object_or_404(db, id):
        if updated_product := product_repo.update(db, product, product_update):
            return updated_product


@router.delete("/{id}/", response_model=schema.MessageResponse)
async def delete_product(
    id: int,
    user: schema.User = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    if product := product_repo.filter_by(db, owner_id=user.id, id=id).first():
        if message := product_repo.delete(db, product):
            return message
    raise HTTPException(status_code=404, detail={"msg": "Item to found"})


@router.get("/list/", response_model=List[schema.Product])
async def products(
    db: Session = Depends(get_db),
    user_id: Optional[int] = Query(
        None,
        description="if specified, returns products that belong the specifed user",
    ),
):

    """Gets available all products
    if user_id is provided, returns products that belong the specifed user


    Returns:
        List[Products]: list of all products

    """
    if user_id:
        return product_repo.filter_by(db, owner_id=user_id).all()
    return product_repo.get_all(db)
