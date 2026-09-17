class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        snums = ''.join(map(lambda n: str(n), nums))
        ones = snums.split('0')

        return max(map(len, ones))
