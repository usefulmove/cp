class Solution:
    def absDifference(self, nums: List[int], k: int) -> int:
        snums = sorted(nums)
        return sum(snums[-k:]) - sum(snums[:k])
