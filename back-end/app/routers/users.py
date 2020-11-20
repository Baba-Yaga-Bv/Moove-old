from fastapi import APIRouter
from app.database import users_collection
from app.models import users_models

router = APIRouter()


@router.get("/")
async def user_basic():
    return {"message": "Hello user!"}


@router.post("/register")
async def register_user(user: users_models.UserRegisterCall):
    print("post call")
    users_collection.insert_user(user)
    return user
