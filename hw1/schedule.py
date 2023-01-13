import datetime
import time
import requests


HOSTNAME = "http://localhost:8080"
USER1 = "s.petrov"
USER2 = "k.kostylev"
START_DATE = "2023-01-13"
TEAM = "team-2"


def set_duties(start, end, primary_user, secondary_user):
    requests.post(
        f"{HOSTNAME}/api/v0/events",
        json={
            "user": primary_user,
            "team": TEAM,
            "role": "primary",
            "start": start,
            "end": end
        }
    )
    requests.post(
        f"{HOSTNAME}/api/v0/events",
        json={
            "user": secondary_user,
            "team": TEAM,
            "role": "secondary",
            "start": start,
            "end": end
        }
    )


def create_schedule(total_days, change_hour, days_in_shift):
    users = [USER1, USER2]
    initial_datetime = datetime.datetime.strptime(f"{START_DATE} {change_hour}", "%Y-%m-%d %H")
    final_datetime = initial_datetime + datetime.timedelta(days=total_days)

    current_datetime = initial_datetime
    while current_datetime < final_datetime:
        users = users[::-1]
        primary_user, secondary_user = users
        shift_end_datetime = current_datetime + datetime.timedelta(days=days_in_shift)
        start = int(time.mktime(current_datetime.timetuple()))
        end = int(time.mktime(shift_end_datetime.timetuple()))
        set_duties(start, end, primary_user, secondary_user)
        current_datetime = shift_end_datetime


if __name__ == "__main__":
    create_schedule(60, 5, 4)
