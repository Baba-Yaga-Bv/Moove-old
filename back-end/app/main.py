from fastapi import FastAPI, Depends
from fastapi.security import OAuth2PasswordRequestForm

from .database import users_collection, token
from .models.models import UserLogin, UserProfile
from mongoengine import *

from .routers import communities, users

app = FastAPI()
connect('moove_database')


@app.get("/")
async def root():
    return {"message": "Hello world!"}


app.include_router(communities.router, prefix="/communities", tags=["communities"])
app.include_router(users.router, prefix="/users", tags=["users"])


@app.post("/token")
async def login_for_access_token(form_data: OAuth2PasswordRequestForm = Depends()):
    user = users_collection.login_user(
        UserLogin(email=form_data.username, password=form_data.password))
    access_token = token.create_access_token(user.id)
    return {"access_token": access_token,
            "token_type": "bearer"}
