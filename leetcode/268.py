from functools import reduce
from operator import xor

class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        return reduce(xor, nums + list(range(len(nums)+1)))
