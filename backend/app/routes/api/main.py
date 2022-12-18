from fastapi import APIRouter
from . import user, auth, products, wallet, orders, address, support,payment

api_router = APIRouter()
api_router.include_router(auth.router)
api_router.include_router(user.router)
api_router.include_router(products.router)
api_router.include_router(wallet.router)
api_router.include_router(orders.router)
api_router.include_router(address.router)
api_router.include_router(support.router)
api_router.include_router(payment.router)