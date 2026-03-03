class Solution:
    def findKthBit(self, n: int, k: int) -> str:
        invert = lambda s: ''.join(
            '0' if c == '1' else '1' for c in s
        )

        s = '0'
        for _ in range(1, n):
            s = s + '1' + invert(s[::-1])

        return s[k - 1]
