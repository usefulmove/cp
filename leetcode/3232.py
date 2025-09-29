class Solution:
    def canAliceWin(self, nums: List[int]) -> bool:
        def f(acc, n):
            return acc + (n if n < 10 else -n)

        return reduce(f, nums, 0) != 0
