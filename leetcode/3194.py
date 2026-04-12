class Solution:
    def minimumAverage(self, nums: List[int]) -> float:
        n = len(nums)
        snums = sorted(nums)
        minsum = 100
        for i in range(n // 2):
            minsum = min(minsum, snums[i] + snums[n-i-1])
        return minsum / 2
