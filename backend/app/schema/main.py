from typing import Any, Dict, Optional
from pydantic import BaseModel


class MessageResponse(BaseModel):
    msg: str
    details: Optional[Dict[str, Any]] = {}
