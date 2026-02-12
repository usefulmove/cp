class Solution:
    def dominantIndices(self, nums: List[int]) -> int:
        count = 0

        for i in range(len(nums) - 1):
            head, *tail = nums[i:]
            if head > sum(tail) / len(tail):
                count += 1

        return count
