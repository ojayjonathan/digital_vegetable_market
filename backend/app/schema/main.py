from typing import Any, Dict, Optional
from pydantic import BaseModel


class MessageResponse(BaseModel):
    message: str
    details: Optional[Dict[str, Any]] = {}
