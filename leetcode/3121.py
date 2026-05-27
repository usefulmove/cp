import itertools

def find_last(lst: list, value) -> int | None:
     try:
         return len(lst) - lst[::-1].index(value) - 1
     except ValueError:
         return None

class Solution:
    def numberOfSpecialChars(self, word: str) -> int:
        cs = set(word)
        cs_lower = set(c for c in cs if c == c.lower())
        candidates = [c for c in cs_lower if c.upper() in cs] 

        def lowers_first(lc):
            lower = find_last(word, lc)
            upper = word.index(lc.upper())
            return lower < upper

        n_specials = 0
        for candidate in candidates:
            if lowers_first(candidate):
                n_specials += 1

        return n_specials
