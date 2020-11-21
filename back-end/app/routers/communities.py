from fastapi import APIRouter, Depends, HTTPException

from app.models.models import Users, CommunityCreate, ChallengeCreate, Community, Challenge
from app.database import users_collection, communities_collection, membership_collection, challenges_collection
from app.models.models import CommunityMembers
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


@router.get("/{community_id}/members")
async def list_community_members(community_id, user: Users = Depends(users_collection.get_user_by_id)):
    # TODO: check if community exist
    members = membership_collection.get_members(community_id)
    response = CommunityMembers(id=community_id)
    for member in members:
        user = users_collection.get_user_by_id(member.user_id)
        response.members.append(CommunityMembers.UserBase(id=str(user.id), name=user.first_name+" "+user.last_name))
    return response


@router.post("/{community_id}/propose_challenge")
async def create_challenge(community_id, _challenge: ChallengeCreate):
    challenges_collection.remove_old_challenge(community_id)
    challenge = challenges_collection.insert_challenge(_challenge)
    challenges_collection.add_challenge_to_community(community_id, str(challenge.id))
    return json.loads(challenge.to_json())


@router.get("/{community_id}/challenge")
async def get_challenge(community_id):
    community = Community.objects(id=community_id).get()
    challenge_id = community.challenge
    if challenge_id == "":
        raise HTTPException(status_code=400, detail="Community has no challenge")
    challenge = Challenge.objects(id=challenge_id).get()
    json_obj = challenge.to_json()
    dictionary = json.loads(json_obj)
    dictionary["id"] = dictionary["_id"]["$oid"]
    del dictionary["_id"]
    return dictionary

