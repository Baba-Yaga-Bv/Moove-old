from bson import ObjectId
from pydantic import EmailStr
from pydantic.class_validators import List
from . import membership_collection

from app.models.models import Users, Community


def insert_community(_name: str, members: List[EmailStr]):
    community = Community(name=_name).save()
    members_ref = Users.objects(__raw__={'email': {'$in': members}})
    for member in members_ref:
        membership_collection.add_membership(str(community.id), str(member.id))
    return community


def get_community_name(community_id: str):
    return Community.objects(id=community_id).get().name


