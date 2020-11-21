from typing import List

from mongoengine import Document, EmailField, StringField, BooleanField
from mongoengine import IntField, ComplexDateTimeField, DictField, ListField
from pydantic import BaseModel, EmailStr
from datetime import datetime
from fastapi import Body
from typing import Optional


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


class UserAddSteps(BaseModel):
    date: datetime = Body(None)
    steps_to_add: int = 0


class Users(Document):
    email = EmailField(required=True)
    password = StringField(required=True)
    first_name = StringField(max_length=50)
    last_name = StringField(max_length=50)
    daily_steps = DictField(default={})
    achievements = ListField(default=[])


class CommunityMembersList(BaseModel):
    members: List[EmailStr]


class CommunityCreate(CommunityMembersList):
    name: str


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


class UserChallenge(BaseModel):
    id: str

    class ChallengeBase(ChallengeCreate):
        id: str
        community_id: str

    challenges: List[ChallengeBase] = []


class CommunityLeaderboard(BaseModel):
    id: str

    class ChallengeUser(BaseModel):
        full_name: str
        score: str

    members: List[ChallengeUser] = []


class Achievement(Document):
    name = StringField(required=True)
    description = StringField(default="")
