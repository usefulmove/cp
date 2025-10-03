from collections import Counter

class Solution:
    def numEquivDominoPairs(self, dominoes: List[List[int]]) -> int:
        ds = map(lambda l: tuple(sorted(l)), dominoes)
        counts = list(Counter(ds).values())
        pairs = reduce(lambda acc, c: acc + (c * (c - 1)) / 2, counts, 0)
        return int(pairs)
