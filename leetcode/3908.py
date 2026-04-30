class Solution:
    def validDigit(self, n: int, x: int) -> bool:
        sn, sx = map(str, [n, x])
        return sn[0] != sx and sx in sn
