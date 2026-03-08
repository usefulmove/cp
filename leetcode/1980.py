class Solution:
    def findDifferentBinaryString(self, nums: List[str]) -> str:
        n = len(nums[0]) 

        for x in range(2 ** n):
            comb = format(x, 'b').zfill(n)
            if comb not in nums:
                return comb

        return ""
