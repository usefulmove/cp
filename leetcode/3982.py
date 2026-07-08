class Solution:
    def maxDigitRange(self, nums: list[int]) -> int:
        def digitRange(a):
            digits = [int(c) for c in str(a)]
            return max(digits) - min(digits)
        drs = [(num, digitRange(num)) for num in nums]
        max_digit_range = max(dr for n, dr in drs)
        maxes = [n for n, dr in drs if dr == max_digit_range]
        return sum(maxes)
