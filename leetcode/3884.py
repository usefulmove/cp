class Solution:
    def firstMatchingIndex(self, s: str) -> int:
        n = len(s)
        mid = n // 2
        for i in range(mid + 1):
            if s[i] == s[n - i - 1]:
                return i
        return -1
