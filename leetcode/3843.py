from collections import Counter

class Solution:
    def firstUniqueFreq(self, nums: List[int]) -> int:
        cnts = Counter(nums)
        cntfreqs = Counter(cnts.values())
        unique_cnts = [cnt for cnt, freq in cntfreqs.items() if freq == 1]
        unique_freq_nums = [n for n, cnt in cnts.items() if cnt in unique_cnts]
        return unique_freq_nums[0] if unique_freq_nums else -1
