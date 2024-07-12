from functools import reduce

def is_armstrong_number(number):
    digits = list(map(int, str(number)))
    n = len(digits)

    return reduce(lambda acc, a: acc + a**n, digits, 0) == number
