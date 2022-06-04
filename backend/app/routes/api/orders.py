from fastapi import APIRouter


router = APIRouter(prefix="/orders")


@router.get("/", tags=[""])
async def user_order():
    pass
