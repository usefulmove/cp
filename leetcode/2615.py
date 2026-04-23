class Solution:
    def distance(self, nums: List[int]) -> List[int]:
        match_inds = {}
        for num in list(set(nums)):
            match_inds[num] = [i for i, n in enumerate(nums) if n == num]
 
        def f(tup):
            ind, num = tup
            if len(match_inds[num]) < 2:
                return 0
            return sum(abs(ind - i) for i in match_inds[num])
            
        return map(f, enumerate(nums))
