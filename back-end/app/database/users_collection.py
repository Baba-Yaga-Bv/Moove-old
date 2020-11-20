from . import connection
from fastapi import HTTPException
from app.models.users_models import *


def check_email_exist(user: UserRegisterCall):
    number = Users.objects(email=user.email).count()
    if number:
        raise HTTPException(status_code=400, detail="Email already registered")
    return user


def login_user(user: UserLogin):
    user_result = Users.objects(email=user.email).first()
    if not user_result:
        raise HTTPException(status_code=400, detail="Invalid email or password")
    if user_result.password != user.password:
        raise HTTPException(status_code=400, detail="Invalid email or password")

    return UserProfile(email=user_result.email,
                       first_name=user_result.first_name,
                       last_name=user_result.last_name)


def insert_user(user: UserRegisterCall):
    Users(email=user.email, password=user.password, first_name=user.first_name, last_name=user.last_name)\
        .save()
