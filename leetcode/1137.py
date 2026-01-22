from functools import cache

class Solution:
    @cache
    def tribonacci(self, n: int) -> int:
        match n:
            case 0:
                return 0
            case 1 | 2:
                return 1
            case _:
                return self.tribonacci(n-1) + self.tribonacci(n-2) + self.tribonacci(n-3)
