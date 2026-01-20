class Solution:
    def minBitwiseArray(self, nums: list[int]) -> list[int]:
        def findIndexSolution(n: int) -> int:
            if n % 2 == 0:
                return -1

            for o in range(n):
                if o | (o + 1) == n:
                    return o

            return -1

        return list(map(findIndexSolution, nums))

solution = Solution()

print(f"{solution.minBitwiseArray([2,3,5,7])= }")  # [-1, 1, 4, 3]
print(f"{solution.minBitwiseArray([11,13,31])= }") # [9, 12, 15]
