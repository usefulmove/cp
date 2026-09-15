class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        snums = sorted(nums, reverse=True)
        return (snums[0] - 1) * (snums[1] - 1)
