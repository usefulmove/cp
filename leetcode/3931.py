class Solution:
    def isAdjacentDiffAtMostTwo(self, s: str) -> bool:
        return all(map(lambda a, b: abs(int(a) - int(b)) < 3, s[:-1], s[1:]))
