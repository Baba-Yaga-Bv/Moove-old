from bson import ObjectId
from starlette import status
from datetime import datetime

from fastapi import HTTPException, Depends
from passlib.context import CryptContext
from app.database import token
from ..models.models import UserLogin, UserRegisterCall, Users, Achievement
from ..database import achievements_collection

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

    return user_result


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


def date_in_dict(_date: datetime.date, dictionary: dict):
    for key, value in dictionary.items():
        date = datetime.strptime(key, "%Y-%m-%d").date()
        if _date == date:
            return str(key)
    return None


def check_completed_achievements(user: Users):
    completed_achievements_names = achievements_collection.get_completed_achievements(user)
    for achievement_name in completed_achievements_names:
        if achievement_name not in user.achievements:
            user.achievements.append(achievement_name)
    user.save()


