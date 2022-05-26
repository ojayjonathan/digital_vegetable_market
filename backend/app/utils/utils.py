from datetime import datetime
from random import randint
from string import ascii_lowercase
from fastapi import HTTPException

from pytest import Session

from app.core.config import get_setting


def random_string(len=10) -> str:
    return "".join([ascii_lowercase[randint(0, 25)] for _ in range(len)])


def random_phone() -> str:
    return "".join(["07", *[str(randint(0, 9)) for _ in range(8)]])


def tz_now() -> datetime:
    return datetime.utcnow() + get_setting().UTC_TIME_DELTA_OFFSET


def get_item_or_404(repo, db: Session, **kwargs):
    """Return first item of HTTPException

    Args:
        repo (BaseRepository): _description_
        db (Session): _description_

    Raises:
        HTTPException: _description_
    Returns:
        _type_: _description_
    """
    if items := repo.filter_by(db, kwargs):
        return items.first()
    raise HTTPException(
        status_code=404,
        detail={"msg": "Item not found"},
    )
