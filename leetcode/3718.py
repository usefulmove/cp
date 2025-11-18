class Solution:
    def missingMultiple(self, nums: List[int], k: int) -> int:
        for n in range(1, len(nums)+2):
            o = n * k
            if o not in nums:
                return o

        return 0
