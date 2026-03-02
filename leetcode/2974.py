class Solution:
    def numberGame(self, nums: List[int]) -> List[int]:
        def swapPos(ns: List[int], out: List[int] = []) -> List[int]:
            if not ns:
                return out

            a, b, *rest = ns

            return swapPos(rest, out + [b] + [a])

        return swapPos(sorted(nums))
