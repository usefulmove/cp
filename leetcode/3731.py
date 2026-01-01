class Solution:
    def findMissingElements(self, nums: List[int]) -> List[int]:
        rng = range(min(nums), max(nums) + 1)

        return sorted(list(o for o in rng if o not in nums))
