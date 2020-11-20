from fastapi import APIRouter, Depends
from app.models.communities_models import *
from app.models.users_models import *
from app.database import users_collection
from app.database import communities_collection
import json

router = APIRouter()


@router.get("/")
async def user_basic():
    return {"message": "Hello community!"}


@router.post("/create", response_model=communities_collection.CommunityCreateResponse)
async def create_community(community: CommunityCreate,
                           user: Users = Depends(users_collection.get_user_by_id)):
    community = communities_collection.insert_community(community.name, community.members)
    result = communities_collection.CommunityCreateResponse(name=community.name)
    for member in community.members:
        result.members.append(communities_collection.CommunityCreateResponse.BaseUser
                              (id=str(member.id), full_name=member.first_name + " " + member.last_name))
    return result
