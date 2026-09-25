#class Solution:
#    def twoSum(self, nums: List[int], target: int) -> List[int]:
#        for i, a in enumerate(nums):
#            for j, b in enumerate(nums):
#                if i != j and a + b == target:
#                    return [i, j]
#        
#        return -1

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for i, a in enumerate(nums):
            match = target - a
            if match in nums:
                j = nums.index(match)
                if i != j:
                    return [i, j]
        return -1
