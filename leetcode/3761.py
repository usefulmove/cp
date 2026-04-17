class Solution:
    def minMirrorPairDistance(self, nums: List[int]) -> int:
        reverse = lambda n: int(str(n)[::-1])
        reversed_nums = list(map(reverse, nums))
        
        min_abs = default = len(nums) + 1
        for i in range(len(nums)-1):
            for j in range(i+1, len(nums)):
                if reversed_nums[i] == nums[j]:
                    min_abs = min(min_abs, j-i)

        return min_abs if min_abs != default else -1
