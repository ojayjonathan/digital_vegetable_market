from app.repository.base import BaseRepository
from app import schema, models


class FeedbackRepository(
    BaseRepository[models.Feedback, schema.FeedbackCreate, schema.FeedbackCreate]
):
    pass
