class Solution:
    def minMoves(self, nums: List[int]) -> int:
        m = max(nums)

        return sum(m - num for num in nums)
