from fastapi import FastAPI

from .routers import communities, users

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello world!"}


app.include_router(communities.router, prefix="/communities", tags=["communities"])
app.include_router(users.router, prefix="/users", tags=["users"])
