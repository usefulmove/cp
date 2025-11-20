class Solution:
    def scoreBalance(self, s: str) -> bool:
        total: int = self.score(s)

        for i in range(1, len(s)):
            sc: int = self.score(s[:i])

            if sc * 2 == total:
                return True

            if sc * 2 > total:
                return False

        return False


    def score(self, s: str) -> int:
        return reduce(lambda sum, c: sum + ord(c) - 96, s)



'''
class Solution:
    def scoreBalance(self, s: str) -> bool:
        for i in range(1, len(s)):
            sa, sb = s[:i], s[i:]

            if self.score(sa) == self.score(sb):
                return True

        return False
    
    def score(self, s: str) -> int:
        return sum((ord(c) - 96) for c in s)
'''
