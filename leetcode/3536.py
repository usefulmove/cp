#!/usr/bin/env python3


class Solution:
    def maxProduct(n: int) -> int:
        def recur(num: int, a: int = 0, b: int = 0) -> int:
            """
            Iterate through the digits of NUM and keep track of the
            two largest digits then return their product.
            """
            if num == 0:
                return a * b

            quotient, digit = divmod(num, 10)

            match digit:
                case digit if digit >= b:
                    return recur(quotient, b, digit)
                case digit if digit >= a:
                    return recur(quotient, digit, b)
                case _:
                    return recur(quotient, a, b)


        return recur(n)


print(Solution.maxProduct(31))
print(Solution.maxProduct(22))
print(Solution.maxProduct(124))
