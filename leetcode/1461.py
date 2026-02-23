class Solution:
    def hasAllCodes(self, s: str, k: int) -> bool:
        for n in reversed(range(2**k)):
            code = bin(n)[2:].zfill(k)
            if not code in s:
                return False
        return True
