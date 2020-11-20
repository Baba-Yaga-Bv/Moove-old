from typing import List

from mongoengine import Document, EmailField, StringField, ListField, ReferenceField
from pydantic import BaseModel, EmailStr


class Community(Document):
    name = StringField(required=True)
    members = ListField(StringField())


class UserLogin(BaseModel):
    email: EmailStr
    password: str


class UserProfile(BaseModel):
    email: EmailStr
    first_name: str
    last_name: str


class UserRegisterCall(UserProfile):
    password: str


class Users(Document):
    email = EmailField(required=True)
    password = StringField(required=True)
    first_name = StringField(max_length=50)
    last_name = StringField(max_length=50)
    communities = ListField(StringField(), default=[])
    to_join = ListField(StringField(), default=[])


class CommunityCreate(BaseModel):
    name: str
    members: List[EmailStr]


class CommunityCreateResponse(BaseModel):
    name: str

    class BaseUser(BaseModel):
        id: str
        full_name: str

    members: List[BaseUser] = []

