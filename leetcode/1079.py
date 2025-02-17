from itertools import combinations, permutations

class Solution:
    def numTilePossibilities(self, tiles: str) -> int:
        combs = []
        lst = list(tiles)
        for r in range(len(lst) + 1):
            for comb in combinations(lst, r):
                combs.extend(permutations(comb))
        combs = list(set(combs))
        return len(combs) - 1
