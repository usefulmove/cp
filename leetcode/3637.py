class Solution:
    def isTrionic(self, nums: List[int]) -> bool:
        if len(nums) < 4:  # need 4 elements for inc-dec-inc
            return False
            
        trends = []
        for i in range(len(nums) - 1):
            match nums[i:]:
                case a, b, *_ if b > a:
                    current = 1 # increasing
                case a, b, *_ if a > b:
                    current = -1 # decreasing
                case _:
                    return False # early exit

            if not trends or trends[-1] != current:
                trends.append(current)
                if len(trends) > 3:  # early exit
                    return False
        
        return trends == [1, -1, 1]


#class Solution:
#    def isTrionic(self, nums: List[int]) -> bool:
#        INC, DEC = True, False # increasing or decreasing
#        TRIONIC = [INC, DEC, INC]
#
#        def binary_difference_reduce(xs: List[int], out: List[bool] = None) -> List[bool]:
#            out = out or []
#
#            match xs:
#                case xs if len(xs) < 2:
#                    return out
#                case a, b, *rest if b > a:
#                    return binary_difference_reduce(
#                        [b] + rest, # cdr
#                        out + [INC] if not out or out[-1] == DEC else out
#                    )
#                case a, b, *rest if a > b:
#                    return binary_difference_reduce(
#                        [b] + rest, # cdr
#                        out + [DEC] if not out or out[-1] == INC else out
#                    )
#                case _:
#                    return [] # short-circuit
#
#        return binary_difference_reduce(nums) == TRIONIC
