from ..models.models import Membership, Challenge
from fastapi import HTTPException


def add_membership(community_id: str, user_id: str):
    return Membership(community_id=community_id, user_id=user_id, is_joined=False).save()


def accept_membership(community_id: str, user_id: str):
    membership = Membership.objects(community_id=community_id, user_id=user_id).get()
    if not membership:
        raise HTTPException(status_code=400, detail="Invalid data")
    membership.is_joined = True
    return membership.save()


def reject_membership(community_id: str, user_id: str):
    membership = Membership.objects(community_id=community_id, user_id=user_id).get()
    if not membership:
        raise HTTPException(status_code=400, detail="Invalid data")
    membership.delete()


def get_members(community_id: str):
    return Membership.objects(community_id=community_id, is_joined=True)


def get_communities(user_id: str):
    communities = Membership.objects(user_id=user_id)
    return communities


def add_challenge_reward(user_id, community_id, challenge_id):
    challenge = Challenge.objects(id=challenge_id).get()
    membership = Membership.objects(user_id=user_id, community_id=community_id).get()

    membership.score += challenge.reward
    return membership.save()


