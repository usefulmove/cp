from itertools import combinations

class Solution:
    def countMaxOrSubsets(self, nums: List[int]) -> int:
        or_max, n_max = 0, 0

        all_combs = []
        for l in range(1, len(nums) + 1):
            combs = combinations(nums, l)
            all_combs.extend(combs)

        for comb in all_combs:
            bitwise_or = reduce(lambda a, acc: acc | a, comb)
 
            if bitwise_or > or_max:
                or_max = bitwise_or
                n_max = 1
            elif bitwise_or == or_max:
                n_max += 1
 
        return n_max
