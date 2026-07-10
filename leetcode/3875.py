from collections import Counter

class Solution:
    def uniformArray(self, nums1: list[int]) -> bool:
        pars = ("odd" if n % 2 else "even" for n in nums1)
        cnts = Counter(pars)

        if cnts["even"] == 0 or cnts["odd"] == 0:
            return True

        if cnts["odd"] > 0:
            return True

        return False
