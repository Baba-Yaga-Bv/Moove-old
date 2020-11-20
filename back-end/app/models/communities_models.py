from pydantic import BaseModel, EmailStr
from mongoengine import Document, EmailField, StringField, ListField, ReferenceField
from .users_models import Users
from typing import Optional, List


class CommunityCreate(BaseModel):
    name: str
    members: List[EmailStr]


class CommunityCreateResponse(BaseModel):
    name: str

    class BaseUser(BaseModel):
        id: str
        full_name: str

    members: List[BaseUser] = []


class Community(Document):
    name = StringField(required=True)
    members = ListField(ReferenceField(Users))
