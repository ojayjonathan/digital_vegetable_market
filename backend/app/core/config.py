from datetime import timedelta
from functools import lru_cache
from typing import Optional, Union, Dict
from pydantic import BaseSettings, PostgresDsn, validator


class Setting(BaseSettings):
    SECRET_KEY: str
    APP_NAME: str = "Vegetable market"
    BASE_API_URL: str = ""
    TEST_USER_PHONE: str
    TEST_USER_EMAIL: str
    TEST_USER_PASSWORD: str
    ACCESS_TOKEN_EXP_MINUTES: int = 7 * 24 * 60
    UTC_TIME_DELTA_OFFSET: timedelta = timedelta(hours=3)

    # DATABASE
    POSTGRES_DB: str
    POSTGRES_SERVER: str
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str

    DATABASE_URI: Optional[Union[PostgresDsn, str]] = None
    TIME_ZONE = "UTC+3"
    MEDIA_URL = "./media/"

    @validator("DATABASE_URI", pre=True)
    def ensemble_database_connection(cls, v: Optional[str], values: Dict[str, any]):
        if isinstance(v, str):
            return v
        return PostgresDsn.build(
            password=values.get("POSTGRES_PASSWORD"),
            scheme="postgresql",
            user=values.get("POSTGRES_USER"),
            host=values.get("POSTGRES_SERVER"),
            path=f"/{values.get('POSTGRES_DB') or ''}",
        )

    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"


@lru_cache()
def get_setting() -> Setting:
    return Setting()
