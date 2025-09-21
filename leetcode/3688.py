from functools import reduce

class Solution:
    def evenNumberBitwiseORs(self, nums: List[int]) -> int:
        evens = (n for n in nums if n % 2 == 0)
        return reduce(lambda a, b: a | b, evens, 0)
