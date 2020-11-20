from app.models.communities_models import *
from app.database.users_collection import *


def insert_community(_name: str, members: List[EmailStr]):
    members_ref = Users.objects(__raw__={'email': {'$in': members}})
    community = Community(name=_name, members=members_ref).save()
    return community
