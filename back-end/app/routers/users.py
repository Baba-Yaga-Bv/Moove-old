from fastapi import APIRouter, Depends
from app.database import users_collection
from app.models import users_models
from app.database import users_collection

router = APIRouter()


@router.get("/")
async def user_basic():
    return {"message": "Hello user!"}


@router.post("/register")
async def register_user(user: users_models.UserRegisterCall =
                        Depends(users_collection.check_email_exist)):
    users_collection.insert_user(user)
    return user


@router.post("/login")
async def login_user(user: users_models.UserProfile = Depends(users_collection.login_user)):
    return user
