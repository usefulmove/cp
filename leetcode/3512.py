from functools import reduce

class Solution:
    def minOperations(self, nums: List[int], k: int) -> int:
        return reduce(lambda a, b: a + b, nums) % k
