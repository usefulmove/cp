class Solution:
    def countOppositeParity(self, nums: list[int]) -> list[int]:
        parity = lambda n: n & 1

        def f(tup) -> int:
            i, n = tup
            return len(list(a for a in nums[i+1:] if parity(a) != parity(n)))

        return list(map(f, enumerate(nums)))
