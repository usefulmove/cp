class Solution:
    def missingMultiple(self, nums: List[int], k: int) -> int:
        for n in range(1, 102):
            if n * k not in nums:
                return n * k

        return 0
