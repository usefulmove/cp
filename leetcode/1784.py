class Solution:
    def checkOnesSegment(self, s: str) -> bool:
        return sum(1 for segment in s.split('0') if segment) < 2
