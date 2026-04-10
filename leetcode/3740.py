class Solution:
    def minimumDistance(self, nums: List[int]) -> int:
        n = len(nums)
        default = 2**31 - 1
        min_distance = default
        def calculate_distance(a, b, c):
            return (b - a) + (c - b) + (c - a)
        
        for i in range(n-2):
            for j in range(i+1, n-1):
                for k in range(j+1, n):
                    if nums[i] == nums[j] == nums[k]:
                        min_distance = min(min_distance, calculate_distance(i, j, k))

        return -1 if min_distance == default else min_distance
