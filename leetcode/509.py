from functools import lru_cache

@lru_cache
class Solution:
    def fib(self, n: int) -> int:
        def fib2(n, a = 0, b = 1):
            match n:
                case 0: return a
                case 1: return b
                case _: return fib2(n - 1, b, a + b)
                
        return fib2(n)        
