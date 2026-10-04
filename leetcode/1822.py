from functools import reduce
import numpy as np

class Solution:
    def arraySign(self, nums: List[int]) -> int:
        return reduce(lambda acc, a: acc * np.sign(a), nums, 1)
