from fastapi import APIRouter, Depends, HTTPException
from fastapi import APIRouter, Depends, UploadFile, File
from fastapi import APIRouter, Depends, HTTPException

from app.models.models import *
from app.database import users_collection
from app.database import membership_collection
from app.database import communities_collection
from app.database import token
from fastapi.responses import StreamingResponse


import json

router = APIRouter()


def prepare_for_return(user: Users):
    json_obj = user.to_json()
    dictionary = json.loads(json_obj)
    del dictionary["password"]
    dictionary["id"] = dictionary["_id"]["$oid"]
    del dictionary["_id"]
    return dictionary


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
            "user_profile": prepare_for_return(user_db)}


@router.post("/login")
async def login_user(user=Depends(users_collection.login_user)):
    access_token = token.create_access_token(user.id)
    return {"access_token": access_token,
            "token_type": "bearer",
            "user_profile": prepare_for_return(user)}


@router.get("/token")
async def validate_token(user: Users = Depends(users_collection.get_user_by_id)):
    return {}


@router.get("/me")
async def get_current_user(user: Users = Depends(users_collection.get_user_by_id)):
    return prepare_for_return(user)


@router.post("/me/upload_photo")
async def upload_user_photo(photo: UploadFile = File(...), user: Users = Depends(users_collection.get_user_by_id)):
    if user.photo:
        user.photo.delete()
    user.photo.put(photo.file, content_type=photo.content_type)
    user.save()
    return {}


@router.get("/me/photo")
async def user_photo(user: Users = Depends(users_collection.get_user_by_id)):
    photo = [user.photo.read()]
    if photo == [None]:
        raise HTTPException(status_code=400, detail="User has no photo")
    aux = user.photo.read()
    while aux:
        photo.append(aux)
        aux = user.photo.read()
    photo = iter(photo)
    return StreamingResponse(photo, media_type=user.photo.get().content_type)


@router.get("/me/challenges")
async def get_user_active_challenges(user: Users = Depends(users_collection.get_user_by_id)):
    communities = membership_collection.get_communities(str(user.id))
    response = UserChallenge(id=str(user.id))
    for community in communities:
        if community.is_joined:
            challenge = communities_collection.get_community_challenge(str(community.community_id))
            if challenge:
                response.challenges.append(UserChallenge.ChallengeBase(
                    name=challenge.name, number_of_steps=challenge.number_of_steps,
                    reward=challenge.reward, start_date=challenge.start_date,
                    end_date=challenge.end_date, id=str(challenge.id),
                    community_id=str(community.id)
                ))
    return response


@router.get("/me/communities")
async def get_current_user_communities(user: Users = Depends(users_collection.get_user_by_id)):
    communities = membership_collection.get_communities(str(user.id))
    response = UserCommunities(id=str(user.id))
    for community in communities:
        response.communities.append(UserCommunities.
                                    CommunityBase(id=community.community_id,
                                                  name=communities_collection.get_community_name(
                                                      community.community_id),
                                                  is_joined=community.is_joined))
    return response


@router.get("/me/{community_id}/add_challenge_reward")
async def update_score(community_id, user: Users = Depends(users_collection.get_user_by_id)):
    community = Community.objects(id=community_id).get()
    challenge_id = community.challenge
    membership = membership_collection.add_challenge_reward(str(user.id), community_id, challenge_id)
    json_obj = membership.to_json()
    dictionary = json.loads(json_obj)
    dictionary["id"] = dictionary["_id"]["$oid"]
    del dictionary["_id"]
    return dictionary


@router.get("/me/{community_id}/get_score")
async def get_score(community_id, user: Users = Depends(users_collection.get_user_by_id)):
    membership = Membership.objects(user_id=str(user.id), community_id=community_id).get()
    return {"Score": membership.score}


@router.post("/me/add_steps")
async def update_steps(userSteps: UserAddSteps, user: Users = Depends(users_collection.get_user_by_id)):
    current_dictionary = {**user.daily_steps}
    date_to_add = userSteps.date.date()
    key = users_collection.date_in_dict(date_to_add, current_dictionary)
    if key is not None:
        current_dictionary[key] += userSteps.steps_to_add
    else:
        current_dictionary[str(date_to_add)] = userSteps.steps_to_add

    user.daily_steps = current_dictionary
    user.save()
    users_collection.check_completed_achievements(user)
    return prepare_for_return(user)


@router.get("/me/{date}/steps")
async def get_steps_at_date(date: str, user: Users = Depends(users_collection.get_user_by_id)):
    current_dictionary = {**user.daily_steps}
    key = users_collection.date_in_dict(datetime.strptime(date, "%Y-%m-%d").date(), current_dictionary)
    if key is not None:
        return {date: current_dictionary[key]}
    else:
        raise HTTPException(status_code=400, detail="No data at this date")


@router.get("/me/achievements")
async def get_user_achievements(user: Users = Depends(users_collection.get_user_by_id)):
    return {"achievements": user.achievements}

