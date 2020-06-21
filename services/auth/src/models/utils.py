from pytz import timezone
from time import time


def time_now():
    return int(time() * 1000.0)
