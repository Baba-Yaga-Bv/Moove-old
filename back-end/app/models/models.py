from typing import List

from mongoengine import Document, EmailField, StringField, BooleanField, IntField, ComplexDateTimeField
from pydantic import BaseModel, EmailStr
from datetime import datetime
from fastapi import Body


class Community(Document):
    name = StringField(required=True)
    challenge = StringField(default="")


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


class CommunityMembers(BaseModel):
    id: str

    class UserBase(BaseModel):
        id: str
        name: str

    members: List[UserBase] = []


class Membership(Document):
    user_id = StringField(required=True)
    community_id = StringField(required=True)
    is_joined = BooleanField(required=True)
    score = IntField(default=0)


class Challenge(Document):
    name = StringField(required=True)
    number_of_steps = IntField(required=True)
    reward = IntField(required=True)
    start_date = ComplexDateTimeField(required=True)
    end_date = ComplexDateTimeField(required=True)


class ChallengeCreate(BaseModel):
    name: str
    number_of_steps: int
    reward: int
    start_date: datetime = Body(None)
    end_date: datetime = Body(None)
