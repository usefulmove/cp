class Solution:
    def numberGame(self, nums: List[int]) -> List[int]:
        def swapPos(ns: List[int], out: List[int] = []) -> List[int]:
            if not ns:
                return out

            return swapPos(ns[2:], out + [ns[1]] + [ns[0]])

        return swapPos(sorted(nums))
