from fastapi import APIRouter

router = APIRouter()


@router.get("/")
async def user_basic():
    return {"message": "Hello community!"}