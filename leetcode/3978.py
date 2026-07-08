class Solution:
    def isMiddleElementUnique(self, nums: list[int]) -> bool:
        counts = Counter(nums)
        middle = nums[len(nums) // 2]
        return counts[middle] == 1
