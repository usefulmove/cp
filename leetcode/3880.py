class Solution:
    def minAbsoluteDifference(self, nums: list[int]) -> int:
        n = len(nums)
        minimum_difference = default = 2**32 - 1
        for i in range(n):
            for j in range(n):
                if nums[i] == 1 and nums[j] == 2:
                    if abs(i - j) < minimum_difference:
                        minimum_difference = abs(i - j)
        return minimum_difference if minimum_difference != default else -1
