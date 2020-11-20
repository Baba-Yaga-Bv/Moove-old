from starlette import status

from . import connection
from fastapi import HTTPException, Depends
from app.models.users_models import *
from passlib.context import CryptContext
from app.database import token

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


def check_email_exist(user: UserRegisterCall):
    number = Users.objects(email=user.email).count()
    if number:
        raise HTTPException(status_code=400, detail="Email already registered")
    return user


def login_user(user: UserLogin):
    user_result = Users.objects(email=user.email).first()
    if not user_result:
        raise HTTPException(status_code=400, detail="Invalid email or password")
    if not pwd_context.verify(user.password, user_result.password):
        raise HTTPException(status_code=400, detail="Invalid email or password")

    return (UserProfile(email=user_result.email,
                        first_name=user_result.first_name,
                        last_name=user_result.last_name),
            user_result.id)


def insert_user(user: UserRegisterCall):
    user = Users(email=user.email,
                 password=pwd_context.hash(user.password),
                 first_name=user.first_name,
                 last_name=user.last_name) \
        .save()
    return user


def get_user_by_id(user_id: str = Depends(token.get_user_id)):
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )
    user_result = Users.objects(id=ObjectId(user_id)).first()
    if not user_result:
        raise credentials_exception

    return user_result


def get_user_by_email(user_email: str):
    return Users.objects(email=user_email)
