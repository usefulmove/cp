class Solution:
    def arrayPairSum(self, nums: List[int]) -> int:
        snums = sorted(nums)
        acc = 0

        for i in range(0, len(nums), 2):
            acc += min(snums[i:i+2])

        return acc

        
#class Solution:
#    def arrayPairSum(self, nums: List[int]) -> int:
#        def recur(ns: List[int], acc: int = 0):
#            if not ns:
#                return acc
#
#            return recur(ns[2:], acc + min(ns[:2]))
#
#        return recur(sorted(nums))class Solution:
