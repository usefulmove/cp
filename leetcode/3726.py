class Solution:
    def removeZeros(self, n: int) -> int:
        return int(''.join(c for c in str(n) if c != '0'))
