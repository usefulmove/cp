def flatten(iterable):
    if iterable == []:
        return []

    a = iterable[0]
    rest = iterable[1:]

    if not isinstance(a, list):
        if a == None:
            return flatten(rest)
        else:
            return [a] + flatten(rest)

    return flatten(a) + flatten(rest)
