class Solution:
    def countFairPairs(self, nums: List[int], lower: int, upper: int) -> int:
        count = 0
        for i in range(0, len(nums)-1):
            for j in range(i+1, len(nums)):
                comb = nums[i] + nums[j]
                if comb >= lower and comb <= upper:
                    count += 1
        return count
