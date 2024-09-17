from collections import Counter

class Solution:
    def uncommonFromSentences(self, s1: str, s2: str) -> List[str]:
        counts = Counter(s1.split(" ") + s2.split(" "))
            
        return [word for word in counts.keys() if counts[word] == 1]
