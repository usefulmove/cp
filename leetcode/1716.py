class Solution:
    def totalMoney(self, n: int) -> int:
        b: int = 7
        q, r = divmod(n, b)

        return (2 * q * r + r * r + r + q * b * b + q * q * b) // 2
