class Solution:
    def minimumSwaps(self, nums: list[int]) -> int:
        zeros = len(list(n for n in nums if n == 0))
        end_zeros = len(list(n for n in nums[-zeros:] if n == 0))
        return zeros - end_zeros
