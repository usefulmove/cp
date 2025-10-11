class Solution:
    def alternatingSum(self, nums: List[int]) -> int:
        def f(acc, pair):
            i, n = pair
            return acc + (n if i % 2 == 0 else -n)

        return reduce(f, enumerate(nums), 0)
