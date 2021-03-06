from app.repository.base import BaseRepository
from app import schema, models


class ProductsRepository(
    BaseRepository[models.Product, schema.ProductCreate, schema.PasswordUpdate]
):
    pass


product_repo = ProductsRepository(models.Product)
