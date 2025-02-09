from functools import reduce

def classify(number):
    if number <= 0:
        raise ValueError("Classification is only possible for positive integers.")

    factors = list(filter(lambda a: number % a == 0, range(1, number)))
    aliquot_sum = reduce(lambda a, b: a + b, factors, 0)

    if number == aliquot_sum:
        return "perfect"
    elif number < aliquot_sum:
        return "abundant"
    else:
        return "deficient"
