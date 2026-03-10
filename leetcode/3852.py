from collections import Counter

class Solution:
    def minDistinctFreqPair(self, nums: list[int]) -> list[int]:
        cnts = sorted(Counter(nums).items(), key=lambda pair: pair[0])
        n = len(cnts)

        for a in range(n-1):
            for b in range(a+1, n):
                if cnts[a][1] != cnts[b][1]:
                    return [cnts[a][0], cnts[b][0]]
        
        return [-1, -1]
        
