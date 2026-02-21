class Solution:
    def countPrimeSetBits(self, left: int, right: int) -> int:
        count = 0
        for a in range(left, right + 1):
            if self.isPrime(bin(a).count('1')):
                count += 1
        return count
        
    def isPrime(self, n: int) -> bool:
        if n == 1:
            return False
        for a in range(2, n):
            if n % a == 0:
                return False
        return True
