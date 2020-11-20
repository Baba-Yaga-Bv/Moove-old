from pydantic import EmailStr
from pydantic.class_validators import List

from app.models.models import Users, Community


def insert_community(_name: str, members: List[EmailStr]):
    members_ref = Users.objects(__raw__={'email': {'$in': members}})
    members_list = []
    for member in members_ref:
        members_list.append(str(member.id))
    community = Community(name=_name, members=members_list).save()
    for member in members_ref[1:]:
        member.to_join.append(str(community.id))
        member.save()
    return community
