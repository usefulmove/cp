class Solution:
    def minimumOperations(self, nums: List[int]) -> int:
        return sum(1 for num in nums if 0 != num % 3)
