class Solution:
    def findMin(self, nums: List[int]) -> int:
        def loop(xs, seed = nums[0]):
            if len(xs) < 2:
                return seed
            if xs[1] < xs[0]:
                return xs[1]
            return loop(xs[1:])
        return loop(nums)
