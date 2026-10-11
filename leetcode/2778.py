class Solution:
    def sumOfSquares(self, nums: List[int]) -> int:
        n = len(nums)
        return sum( a * a for i, a in enumerate(nums) if n % (i + 1) == 0 )
