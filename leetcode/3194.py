class Solution:
    def minimumAverage(self, nums: List[int]) -> float:
        middle = len(nums) // 2
        snums = sorted(nums)
        lows = snums[:middle][::-1]
        highs = snums[middle:]

        sums = []
        while lows:
            sums.append(lows.pop() + highs.pop())

        return min(sums) / 2
