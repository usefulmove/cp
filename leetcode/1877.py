class Solution:
    def minPairSum(self, nums: List[int]) -> int:
        snums: List[int] = sorted(nums)

        max_pair_sum: int = 0

        i = 0
        j = len(nums) - 1

        while i < j:
            max_pair_sum = max(max_pair_sum, snums[i] + snums[j])
            i += 1
            j -= 1

        return max_pair_sum


#    def minPairSum(self, nums: List[int]) -> int:
#        snums = sorted(nums)
#
#        def recur(sns, max_pair_sum = 0) -> int:
#            if not sns:
#                return max_pair_sum
#
#            return recur(sns[1:-1], max(max_pair_sum, sns[0] + sns[-1]))
#
#        return recur(snums)
