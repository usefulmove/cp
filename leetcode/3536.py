#!/usr/bin/env python3


class Solution:
    def maxProduct(self, n: int) -> int:
        return self.recur(n)

    def recur(self, num: int, a: int = 0, b: int = 0) -> int:
        """
        Iterate through the digits of NUM and keep track of the
        two largest digits then return their product.
        """
        if num == 0:
            return a * b

        quotient, digit = divmod(num, 10)

        match digit:
            case digit if digit >= b:
                return self.recur(quotient, b, digit)
            case digit if digit >= a:
                return self.recur(quotient, digit, b)
            case _:
                return self.recur(quotient, a, b)


s = Solution()


print(s.maxProduct(31))
print(s.maxProduct(22))
print(s.maxProduct(124))
