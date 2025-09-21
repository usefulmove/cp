from functools import reduce

class Solution:
    def minimumSubarrayLength(self, nums: List[int], k: int) -> int:
        shortest = 51

        for i in range(len(nums)):
            for j in range(i + 1, len(nums) + 1):
                sub = nums[i:j]
                if reduce(lambda a, b: a | b, sub) >= k:
                    if j - i < shortest:
                        shortest = j - i

        return shortest if shortest != 51 else -1
