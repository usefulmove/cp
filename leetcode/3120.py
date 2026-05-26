class Solution:
    def numberOfSpecialChars(self, word: str) -> int:
        cs = set(word)
        cs_lower = set(c for c in cs if c == c.lower())
        return sum(1 for c in cs_lower if c.upper() in cs)
