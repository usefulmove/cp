class Solution:
    def digitFrequencyScore(self, n: int) -> int:
        return sum(map(lambda c: int(c), str(n)))
