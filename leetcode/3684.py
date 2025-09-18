class Solution:
    def maxKDistinct(self, nums: List[int], k: int) -> List[int]:
        sds = sorted(list(set(nums)), reverse=True) # sorted distincts
        return sds[:k]
