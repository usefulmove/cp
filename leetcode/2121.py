class Solution:
    def getDistances(self, arr: List[int]) -> List[int]:
        match_inds = {}
        for num in list(set(arr)):
            match_inds[num] = [i for i, n in enumerate(arr) if n == num]
 
        def f(tup):
            ind, num = tup
            if len(match_inds[num]) < 2:
                return 0
            return sum(abs(ind - i) for i in match_inds[num])
            
        return map(f, enumerate(arr))
