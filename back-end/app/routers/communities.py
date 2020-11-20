from fastapi import APIRouter, Depends

import app.models.models
from app.models.models import Users, CommunityCreate
from app.database import users_collection
from app.database import communities_collection
from app.database import membership_collection
import json

router = APIRouter()


@router.get("/")
async def user_basic():
    return {"message": "Hello community!"}


@router.post("/create")
async def create_community(community: CommunityCreate,
                           user: Users = Depends(users_collection.get_user_by_id)):
    community = communities_collection.insert_community(community.name, community.members)
    return json.loads(community.to_json())


@router.post("/{community_id}/join")
async def join_in_community(community_id, user: Users = Depends(users_collection.get_user_by_id)):
    # TODO: check if community exist
    membership_collection.accept_membership(community_id, str(user.id))
    return {"message": "Joined in community"}


@router.post("/{community_id}/reject")
async def reject_community(community_id, user: Users = Depends(users_collection.get_user_by_id)):
    # TODO: check if community exist
    membership_collection.reject_membership(community_id, str(user.id))
    return {"message": "Rejected the community"}
