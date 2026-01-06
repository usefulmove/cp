class Solution:
    def smallerNumbersThanCurrent(self, nums: List[int]) -> List[int]:
        out = map(lambda a : len(list(filter(lambda b : b < a, nums))), nums)
        return list(out)
