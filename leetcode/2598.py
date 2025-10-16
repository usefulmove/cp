from collections import Counter

class Solution:
    def findSmallestInteger(self, nums: List[int], value: int) -> int:
        mod_counts = Counter(n % value for n in nums)

        index_cnts = [0] * value # initialize index counts

        for n, cnt in mod_counts.items():
            index_cnts[n] = cnt

        stop_cnt = min(index_cnts)

        res = [i + (c * value) for i, c in enumerate(index_cnts) if c == stop_cnt][0]

        return res
