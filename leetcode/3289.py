class Solution:
    def getSneakyNumbers(self, nums: List[int]) -> List[int]:
        def loop(ns: List[int], seen: List[int] = [], out: List[int] = []) -> List[int]:
            if not ns:
                return out

            if ns[0] in seen:
                return loop(ns[1:], seen, out + [ns[0]])

            return loop(ns[1:], seen + [ns[0]], out)

        return loop(nums)
