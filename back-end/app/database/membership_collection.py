from ..models.models import Membership
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
    members = Membership.objects(community_id=community_id, is_joined=True)
    return members


def get_communities(user_id: str):
    communities = Membership.objects(user_id=user_id)
    return communities
