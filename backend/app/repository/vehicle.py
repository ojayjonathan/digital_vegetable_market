from app import models, schema
from app.repository.base import BaseRepository


class VehicleRepository(
    BaseRepository[models.Vehicle, schema.VehicleCreate, schema.VehicleUpdate]
):
    pass


vehicle_repo = VehicleRepository(models.Vehicle)
