class Solution:
    def maximumPrimeDifference(self, nums: List[int]) -> int:
        primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41,
                  43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
        inds = [i for i, n in enumerate(nums) if n in primes]

        return inds[-1] - inds[0] if len(inds) > 1 else 0
