class Solution:
    def maxAlternatingSum(self, nums: List[int]) -> int:
        sum_sq = lambda lst: sum(n * n for n in lst)

        snums = sorted(nums, key=lambda n: abs(n), reverse=True)

        hlen = (len(nums) + 1) // 2 # half length

        return sum_sq(snums[:hlen]) - sum_sq(snums[hlen:])
