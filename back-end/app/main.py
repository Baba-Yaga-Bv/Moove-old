from fastapi import FastAPI
from mongoengine import *

from .routers import communities, users

app = FastAPI()
connect('moove_database')


@app.get("/")
async def root():
    return {"message": "Hello world!"}


app.include_router(communities.router, prefix="/communities", tags=["communities"])
app.include_router(users.router, prefix="/users", tags=["users"])
