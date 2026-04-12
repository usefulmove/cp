class Solution:
    def countDigitOccurrences(self, nums: list[int], digit: int) -> int:
        def count_digits(n, cnt = 0):
            if n == 0:
                return cnt
            return count_digits(n // 10, cnt + 1 if digit == n % 10 else cnt)

        def f(acc, a):
            return acc + count_digits(a)

        return reduce(f, nums, 0)
