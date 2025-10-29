class Solution:
    def smallestNumber(self, n: int) -> int:
        return int("1" * len(f'{n:b}'), 2)
