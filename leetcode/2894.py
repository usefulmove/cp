def differenceOfSums(n, m):
    return reduce(
        lambda acc, a: acc + (-a if 0 == a % m else a),
        range(1, n+1),
        0
    )

differenceOfSums(10, 3)
