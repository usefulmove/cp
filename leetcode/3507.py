class Solution:
    def minimumPairRemoval(self, nums: List[int]) -> int:
        def isSorted(lst: List[int]) -> bool:
            return all(map(lambda a, b: (b - a) >= 0, lst[:-1], lst[1:]))

        def recur(lst: List[int], ops: int = 0) -> int:
            if isSorted(lst):
                return ops
            
            pair_sums = list(map(lambda a, b: a + b, lst[:-1], lst[1:]))
            min_sum = min(pair_sums)
            pair = pair_sums.index(min_sum)

            updated_lst = lst[:pair] + [min_sum] + lst[pair+2:]

            return recur(updated_lst, ops + 1)
            
        return recur(nums)
