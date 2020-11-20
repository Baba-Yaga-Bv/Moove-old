from . import connection
from app.models.users_models import UserRegisterCall


def insert_user(user: UserRegisterCall):
    print("insert in collection")
    result = connection.users_collection.insert_one(user.dict())
    print(result)
    print("insert user")
