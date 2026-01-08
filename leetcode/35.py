class Solution:
    def searchInsert(self, nums: List[int], target: int) -> int:
        """ Use binary search to find insertion point. """
        bottom, top = 0, len(nums) - 1

        while bottom <= top:
            middle = (bottom + top) // 2
            num = nums[middle]

            if num == target:
                break

            if bottom == top:
                if num < target:
                    middle += 1
                break

            if num < target:
                bottom = middle + 1
            else:
                top = middle - 1

        return middle

#class Solution:
#    def searchInsert(self, nums: List[int], target: int) -> int:
#        for ind, num in enumerate(nums):
#            if num >= target:
#                return ind
#                
#        return len(nums)

#class Solution:
#    def searchInsert(self, nums: List[int], target: int) -> int:
#        def loop(ns: List[int], ind: int = 0) -> int:
#            if ind == len(nums) or ns[0] >= target:
#                return ind
#            return loop(ns[1:], ind + 1)
#            
#        return loop(nums)
