from collections import Counter

class Solution:
    primes = [
        2, 3, 5, 7, 11, 13, 17, 19, 23, 29,
        31, 37, 41, 43, 47, 53, 59, 61, 67,
        71, 73, 79, 83, 89, 97
    ]

    def isPrime(self, n: int) -> bool:
        return n in primes

    def checkPrimeFrequency(self, nums: List[int]) -> bool:
        counts = Counter(nums)
        return any(map(self.isPrime, counts.values()))
