from collections import Counter

class Solution:
    def judgeCircle(self, moves: str) -> bool:
        counts = dict(Counter(moves))
        return (counts.get('L', 0) == counts.get('R', 0)) and \
               (counts.get('U', 0) == counts.get('D', 0))
        
