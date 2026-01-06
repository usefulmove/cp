from collections import Counter

class Solution:
    def sumDivisibleByK(self, nums: List[int], k: int) -> int:
        counts = Counter(nums)
        return sum(n * count for n, count in counts.items() if count % k == 0)
