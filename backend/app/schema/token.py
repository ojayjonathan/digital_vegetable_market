from typing import Optional

from pydantic import BaseModel


class AccessToken(BaseModel):
    token_type: Optional[str] = "access_token"
    access_token: str
