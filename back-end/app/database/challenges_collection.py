from app.models.models import Community, ChallengeCreate, Challenge


def insert_challenge(challenge: ChallengeCreate):
    challenge = Challenge(name=challenge.name,
                          number_of_steps=challenge.number_of_steps,
                          reward=challenge.reward,
                          start_date=challenge.start_date,
                          end_date=challenge.end_date).save()
    return challenge


def add_challenge_to_community(community_id, challenge_id):
    community = Community.objects(id=community_id).get()
    community.challenge = challenge_id
    community.save()


def remove_old_challenge(community_id):
    community = Community.objects(id=community_id).get()

    old_challenge_id = community.challenge
    if old_challenge_id != "":
        challenge = Challenge.objects(id=old_challenge_id).get()
        challenge.delete()

    community.challenge = ""
    community.save()
