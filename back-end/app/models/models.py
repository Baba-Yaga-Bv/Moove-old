from typing import List

from mongoengine import Document, EmailField, StringField, BooleanField
from pydantic import BaseModel, EmailStr


class Community(Document):
    name = StringField(required=True)


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


class CommunityCreate(BaseModel):
    name: str
    members: List[EmailStr]


class CommunityCreateResponse(BaseModel):
    name: str

    class BaseUser(BaseModel):
        id: str
        full_name: str

    members: List[BaseUser] = []


class UserCommunities(BaseModel):
    id: str

    class CommunityBase(BaseModel):
        id: str
        name: str
        is_joined: bool

    communities: List[CommunityBase] = []


class Membership(Document):
    user_id = StringField(required=True)
    community_id = StringField(required=True)
    is_joined = BooleanField(required=True)
