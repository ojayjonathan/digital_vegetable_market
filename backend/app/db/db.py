from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from app.core.config import get_setting

engine = create_engine(
    get_setting().DATABASE_URI,
)

SessionLocal = sessionmaker(bind=engine, autocommit=False, autoflush=False)
