class Solution:
    def findErrorNums(self, nums: List[int]) -> List[int]:
        def loop(ns, ind = 1, miss = 0, dup = 0, seen = set()):
            if not ns:
                return [dup, miss]
            
            n, *rest = ns

            if n != ind and ind not in nums:
                miss = ind
            
            if n in seen:
                dup = n

            seen.add(n)

            return loop(rest, ind + 1, miss, dup, seen)

        return loop(sorted(nums))
