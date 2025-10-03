class Solution:
    def canAliceWin(self, nums: List[int]) -> bool:
        f = lambda acc, n: acc + (n if n < 10 else -n)
        return reduce(f, nums, 0) != 0
