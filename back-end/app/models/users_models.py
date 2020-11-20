from pydantic import BaseModel, EmailStr, Field
from typing import Optional
from .pydantic_objectid import PyObjectId
from bson import ObjectId


class UserRegisterCall(BaseModel):
    email: EmailStr
    password: str
    first_name: str
    last_name: str


class UserDB(UserRegisterCall):
   id: Optional[PyObjectId] = Field(alias='_id')
