class Solution:
    def vowelConsonantScore(self, s: str) -> int:
        isvowel = lambda c: c in "aeoiu"
        isconsonant = lambda c: c in "bcdfghjklmnpqrstvwxyz"

        def recur(s: str, vs: int = 0, cs: int = 0) -> tuple[int, int]:
            if not s:
                return (vs, cs)
                
            c, *rest = s
            match c:
                case c if isvowel(c):
                    return recur(rest, vs + 1, cs)
                case c if isconsonant(c):
                    return recur(rest, vs, cs + 1)
                case _: 
                    return recur(rest, vs, cs)

        vowels, consonants = recur(s)

        return vowels // consonants if consonants != 0 else 0
