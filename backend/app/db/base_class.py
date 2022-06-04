from sqlalchemy import Column, Integer
from sqlalchemy.ext.declarative import as_declarative, declared_attr
from sqlalchemy.orm.state import InstanceState


@as_declarative()
class Base:
    id = Column(Integer(), primary_key=True)
    __name__: str

    @declared_attr
    def __tablename__(cls) -> str:
        return cls.__name__

    def __repr__(self) -> str:
        params = [
            f"{k}={v}"
            for k, v in self.__dict__.items()
            if not isinstance(v, InstanceState)
        ]
        return f"{self.__tablename__}({', '.join(params)})"
