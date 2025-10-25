class Solution:
    def totalMoney(self, n: int) -> int:
        b: int = 7
        q: int = n // b
        r: int = n % b

        return (2 * q * r + r * r + r + q * b * b + q * q * b) // 2
