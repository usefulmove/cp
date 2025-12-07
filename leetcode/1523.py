class Solution:
    def countOdds(self, low: int, high: int) -> int:
        count_nums = high - low + 1

        return count_nums // 2 + (1 if low % 2 and high % 2 else 0)


#class Solution:
#    def countOdds(self, low: int, high: int) -> int:
#        def odd(num):
#            return num % 2 == 1
#
#        count_nums = high - low + 1
#
#        if odd(low) and odd(count_nums):
#            return count_nums // 2 + 1
#        else:
#            return count_nums // 2
