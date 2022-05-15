from random import randint
from string import ascii_lowercase


def random_string(len=10) -> str:
    return "".join([ascii_lowercase[randint(0, 25)] for _ in range(len)])


def random_phone() -> str:
    return "".join(["07", *[str(randint(0, 9)) for _ in range(8)]])
