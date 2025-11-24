# Iterate through each digit (`(remainder num 10)`) of `n` from right to left and for each non-zero digit, keep track of the sum of digits (`mult`) and the reconstructed number (`base`), and a scaling factor (`m`) used to calculate the reconstructed number at each non-zero step. When a zero digit is encountered, skip it and leave each of the tracked values unchanged. Once the iteration is complete (`(zero? num)`), return the reconstructed base multiplied by the multiplier (digit sum).

class Solution:
    def sumAndMultiply(self, n: int) -> int:
        def recur(num, base = 0, m = 1, mult = 0):

            if not num:
                return base * mult

            quot, rem = divmod(num, 10)

            if not rem:
                return recur(quot, base, m, mult)

            return recur(quot, base + rem * m, m * 10, mult + rem)

        return recur(n)
