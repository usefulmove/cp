class Solution:
    def largestEven(self, s: str) -> str:
        if not s:
            return ""

        if s[-1] == '2':
            return s

        return self.largestEven(s[:-1])
