from pydantic import BaseModel, EmailStr, Field
from typing import Optional
from .pydantic_objectid import PyObjectId
from bson import ObjectId
from mongoengine import *


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
