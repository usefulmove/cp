class Solution:
    def canMakeArithmeticProgression(self, arr: List[int]) -> bool:
        sarr = sorted(arr)
        return all(map(lambda a, b: a - b == sarr[0] - sarr[1], sarr[:-1], sarr[1:]))
