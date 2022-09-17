from typing import List
from fastapi import APIRouter, Depends, Body
from app import schema, models
from app.routes.deps import get_db, current_user
from sqlalchemy.orm import Session
from app.repository.user import address_repo


router = APIRouter(prefix="/address", tags=["address"])


@router.get("/", response_model=List[schema.Address])
async def address(
    db: Session = Depends(get_db),
    user: models.User = Depends(current_user),
):
    return address_repo.filter_by(db, user_id=user.id).all()


@router.post("/",response_model=schema.Address)
async def create_address(
    db: Session = Depends(get_db),
    user: models.User = Depends(current_user),
    item: schema.AddressCreate = Body(...),
):
    if not item.user_id:
        item.user_id = user.id
    return address_repo.create(db, item=item)


@router.post("/{id}", response_model=schema.Address)
async def update_address(
    id: int,
    db: Session = Depends(get_db),
    user: models.User = Depends(current_user),
    item: schema.AddressUpdate = Body(...),
):
    address = address_repo.get_object_or_404(db, id=id, user_id=user.id)
    return address_repo.update(db, item_in=item, current_item=address)


@router.delete("/{id}", response_model=schema.Address)
async def delete_address(
    id: int,
    db: Session = Depends(get_db),
    _: models.User = Depends(current_user),
):
    return address_repo.delete(db, id=id)


@router.get("/{id}", response_model=schema.Address)
async def get_address(
    id: int,
    db: Session = Depends(get_db),
    _: models.User = Depends(current_user),
):
    return address_repo.get_object_or_404(db, id=id)
