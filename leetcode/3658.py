class Solution:
    return n


# class Solution:
#     def gcdOfOddEvenSums(self, n: int) -> int:
#         def gcd(a: int, b: int) -> int:
#             match b:
#                 case 0:
#                     return a
#                 case _:
#                     return gcd(b, a%b)
#         sumOdd = sumEven = 0
#         for i in range(1, n+1):
#             sumOdd  += 2*i - 1
#             sumEven += 2*i
#         return gcd(sumOdd, sumEven)
