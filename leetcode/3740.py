class Solution:
    def minimumDistance(self, nums: List[int]) -> int:
        n = len(nums)
        min_distance = default = 200
        distance = lambda a, b, c: (c - a) << 1
        
        for i in range(n-2):
            for j in range(i+1, n-1):
                for k in range(j+1, n):
                    if nums[i] == nums[j] == nums[k]:
                        min_distance = min(min_distance, distance(i, j, k))

        return -1 if min_distance == default else min_distance
