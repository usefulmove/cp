class Solution:
    def triangularSum(self, nums: List[int]) -> int:
        if len(nums) == 1:
            return nums[0]
        return self.triangularSum(self.red(nums))

    def red(self, nums: List[int]) -> List[int]:
        f = lambda a, b: (a + b) % 10
        return list(map(f, nums[:-1], nums[1:]))
