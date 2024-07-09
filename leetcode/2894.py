def differenceOfSums(n, m):
    def f(acc, a):
        if 0 == a % m:
            return (acc[0]+a, acc[1])
        else:
            return (acc[0], acc[1]+a)

    sum_pair = reduce(f, range(1, n+1), (0, 0))

    return sum_pair[1] - sum_pair[0]


differenceOfSums(10, 3)
