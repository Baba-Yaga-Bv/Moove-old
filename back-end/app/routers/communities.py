from fastapi import APIRouter, Depends

import app.models.models
from app.models.models import Users, CommunityCreate
from app.database import users_collection
from app.database import communities_collection

router = APIRouter()


@router.get("/")
async def user_basic():
    return {"message": "Hello community!"}


@router.post("/create", response_model=app.models.models.CommunityCreateResponse)
async def create_community(community: CommunityCreate,
                           user: Users = Depends(users_collection.get_user_by_id)):
    community = communities_collection.insert_community(community.name, community.members)
    result = app.models.models.CommunityCreateResponse(name=community.name)
    for member_id in community.members:
        member = users_collection.get_user_by_id(member_id)
        result.members.append(app.models.models.CommunityCreateResponse.BaseUser
                              (id=str(member.id), full_name=member.first_name + " " + member.last_name))
    return result


@router.post("/{community_id}/join")
async def join_in_community(community_id, user: Users = Depends(users_collection.get_user_by_id)):
    # TODO: check if community exist
    user.communities.append(community_id)
    user.save()
    user.update(pull__to_join=community_id)
    return {"message": "joined in board"}
