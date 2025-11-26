class Solution:
    def minimumDifference(self, nums: List[int], k: int) -> int:
        if len(nums) == k:
            return max(nums) - min(nums)

        snums = sorted(nums)
        mdif = 100000

        for i in range(len(nums) - k + 1):
            dif = snums[i + k - 1] - snums[i]

            if dif < mdif:
                mdif = dif

        return mdif
