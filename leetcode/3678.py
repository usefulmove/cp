import math

class Solution:
    def smallestAbsent(self, nums: List[int]) -> int:
        avg: float = sum(nums) / len(nums)

        def recur(a: int) -> int:
            if a in nums or a < 1:
                return recur(a + 1)
            else:
                return a

        return recur(int(avg) + 1 if avg.is_integer() else int(math.ceil(avg)))
