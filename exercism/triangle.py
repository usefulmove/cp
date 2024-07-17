def equilateral(sides):
    a, b, c = sorted(sides)

    if c > a + b or any(map(lambda s: s == 0, sides)):
        return False

    return all(map(lambda s: s == a, sides))


def isosceles(sides):
    a, b, c = sorted(sides)

    if c > a + b or any(map(lambda s: s == 0, sides)):
        return False

    return a == b or b == c


def scalene(sides):
    a, b, c = sorted(sides)

    if c > a + b or any(map(lambda s: s == 0, sides)):
        return False

    return a != b and b != c
