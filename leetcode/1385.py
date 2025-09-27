class Solution:
    def findTheDistanceValue(self, arr1: List[int], arr2: List[int], d: int) -> int:
        def f(n: int) -> int:
            g = lambda m: n - d <= m <= n + d
            return sum(1 for n in arr2 if g(n)) == 0

        return sum(1 for n in arr1 if f(n))


class Solution:
    def findTheDistanceValue(self, arr1: List[int], arr2: List[int], d:int) -> int:
        def f(n: int) -> int:
            def g(m: int) -> int:
                return n - d <= m <= n + d
            return len(list(filter(g, arr2))) == 0

        return len(list(filter(f, arr1)))
