from functools import cache

class Solution:
    def climbStairs(self, n: int) -> int:
        if n == 1: return 1

        @cache
        def climb(step):
            if step == n: return 1
            if step > n: return 0
            return climb(step + 1) + climb(step + 2)
        
        return climb(0)
