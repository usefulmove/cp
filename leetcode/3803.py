class Solution:
    def residuePrefixes(self, s: str) -> int:
        def residue(pre: str) -> bool:
            n_distincts: int = len(Counter(pre))
            n = len(pre)
            return n_distincts == n % 3

        cnt: int = 0
        for i in range(1, len(s)+1):
            if residue(s[:i]):
                cnt += 1
        return cnt
