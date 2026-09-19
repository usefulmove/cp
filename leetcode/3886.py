class Solution:
    def firstUniqueEven(self, nums: list[int]) -> int:
        even_uniques = [n for n, cnt in Counter(nums).items() if cnt == 1 and n % 2 == 0]
        for n in nums:
            if n in even_uniques:
                return n
        return -1
