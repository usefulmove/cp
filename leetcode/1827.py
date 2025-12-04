class Solution:
    def minOperations(self, nums: List[int]) -> int:
        def recur(ns, ops = 0):
            match ns:
                case []:
                    return ops
                case [_]:
                    return recur([], ops)
                case a, b, *rest if b <= a:
                    return recur([a + 1] + rest, ops + a + 1 - b)
                case _:
                    return recur(ns[1:], ops)

        return recur(nums)
