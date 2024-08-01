class Solution:
    def countSeniors(self, details: List[str]) -> int:
        return sum(1 for s in details if int(s[11:13]) > 60)
