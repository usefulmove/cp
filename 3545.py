from collections import Counter

class Solution:
    def minDeletion(self, s: str, k: int) -> int:
        counts = Counter(s)
        cs = counts.most_common()[::-1]
        
        if k < len(cs):
            return sum(map(lambda pair: pair[1], cs[:len(cs)-k]))
        else:
            return 0
