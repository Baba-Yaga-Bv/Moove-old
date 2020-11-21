from ..models.models import Achievement, Users


def create_achievement(name: str, description: str):
    achievement = Achievement(name=name, description=description).save()


def get_completed_achievements(user: Users):
    lst = []
    if achievement_high_steps_1(user):
        lst.append("lots of steps 1")
    if achievement_high_steps_2(user):
        lst.append("lots of steps 2")
    if achievement_high_steps_3(user):
        lst.append("lots of steps 3")
    if achievement_high_steps_4(user):
        lst.append("lots of steps 4")
    if achievement_high_steps_5(user):
        lst.append("lots of steps 5")
    if achievement_high_steps_6(user):
        lst.append("lots of steps 6")
    if achievement_high_steps_7(user):
        lst.append("lots of steps 7")
    if achievement_three_days_steps_1(user):
        lst.append("three consecutive days 1")
    if achievement_three_days_steps_2(user):
        lst.append("three consecutive days 2")
    if achievement_three_days_steps_3(user):
        lst.append("three consecutive days 3")
    if achievement_three_days_steps_4(user):
        lst.append("three consecutive days 4")
    if achievement_three_days_steps_5(user):
        lst.append("three consecutive days 5")
    if achievement_three_days_steps_6(user):
        lst.append("three consecutive days 6")
    if achievement_three_days_steps_7(user):
        lst.append("three consecutive days 7")
    if achievement_three_days_steps_8(user):
        lst.append("three consecutive days 8")

    return lst



def populate_achievements_db():
    create_achievement("three consecutive days 1", "")
    create_achievement("three consecutive days 2", "")
    create_achievement("three consecutive days 3", "")
    create_achievement("three consecutive days 4", "")
    create_achievement("three consecutive days 5", "")
    create_achievement("three consecutive days 6", "")
    create_achievement("three consecutive days 7", "")
    create_achievement("three consecutive days 8", "")

    create_achievement("lots of steps 1", "")
    create_achievement("lots of steps 2", "")
    create_achievement("lots of steps 3", "")
    create_achievement("lots of steps 4", "")
    create_achievement("lots of steps 5", "")
    create_achievement("lots of steps 6", "")
    create_achievement("lots of steps 7", "")


def check_high_steps(x: int, user: Users):
    day1 = list({**user.daily_steps}.values())[-1]
    if day1 >= x:
        return True
    return False


def check_three_day(x: int, user: Users):
    days = list({**user.daily_steps}.values())[-3:]
    if len(days) >= 3:
        day1 = days[0]
        day2 = days[1]
        day3 = days[2]
        if day1 >= x and day2 >= x and day3 >= x:
            return True
    return False


def achievement_high_steps_1(user: Users):
    return check_high_steps(10000, user)


def achievement_high_steps_2(user: Users):
    return check_high_steps(15000, user)


def achievement_high_steps_3(user: Users):
    return check_high_steps(20000, user)


def achievement_high_steps_4(user: Users):
    return check_high_steps(25000, user)


def achievement_high_steps_5(user: Users):
    return check_high_steps(30000, user)


def achievement_high_steps_6(user: Users):
    return check_high_steps(40000, user)


def achievement_high_steps_7(user: Users):
    return check_high_steps(50000, user)


def achievement_three_days_steps_1(user: Users):
    return check_three_day(3000, user)


def achievement_three_days_steps_2(user: Users):
    return check_three_day(4000, user)


def achievement_three_days_steps_3(user: Users):
    return check_three_day(5000, user)


def achievement_three_days_steps_4(user: Users):
    return check_three_day(6000, user)


def achievement_three_days_steps_5(user: Users):
    return check_three_day(7000, user)


def achievement_three_days_steps_6(user: Users):
    return check_three_day(8000, user)


def achievement_three_days_steps_7(user: Users):
    return check_three_day(9000, user)


def achievement_three_days_steps_8(user: Users):
    return check_three_day(10000, user)
