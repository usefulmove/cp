class Solution:
    def minimumFlips(self, n: int) -> int:
        bin = f"{n:b}"
        return sum(a != b for a, b in zip(bin, reversed(bin)))
