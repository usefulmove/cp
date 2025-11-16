class Solution:
    def maximizeExpressionOfThree(self, nums: List[int]) -> int:
        def loop(ns, a, y, z):
            if not ns:
                return y + z - a

            n, *rest = ns

            if n >= z:
                return loop(rest, a, z, n)
            if n < a:
                return loop(rest, n, y, z)
            if n > y:
                return loop(rest, a, n, z)

            return loop(rest, a, y, z)

        ao, yo, zo = sorted(nums[:3])

        return loop(nums[3:], ao, yo, zo)
