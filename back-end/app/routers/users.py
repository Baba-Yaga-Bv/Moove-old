from fastapi import APIRouter, Depends
from app.database import users_collection
from app.models.users_models import *
from app.database import users_collection
from app.database import token

router = APIRouter()


@router.get("/")
async def user_basic():
    return {"message": "Hello user!"}


@router.post("/register")
async def register_user(user: UserRegisterCall =
                        Depends(users_collection.check_email_exist)):
    user_db = users_collection.insert_user(user)
    # TODO: check insert succeeded, id != None
    access_token = token.create_access_token(user_db.id)
    return {"access_token": access_token,
            "token_type": "bearer",
            "user_profile": UserProfile(**user.dict())}


@router.post("/login")
async def login_user(user=Depends(users_collection.login_user)):
    access_token = token.create_access_token(user[1])
    return {"access_token": access_token,
            "token_type": "bearer",
            "user_profile": UserProfile(**user[0].dict())}
