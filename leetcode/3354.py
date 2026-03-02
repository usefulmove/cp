class Solution:
    def countValidSelections(self, nums: List[int]) -> int:
        cnt = 0
        n = len(nums)
        
        for ind in range(n):
            if nums[ind] != 0:
                continue
                
            for direction in [1, -1]:
                ns = nums.copy()
                cur = ind
                d = direction
                
                while 0 <= cur < n:
                    if ns[cur] == 0:
                        cur += d
                    else:
                        ns[cur] -= 1
                        d = -d
                        cur += d
                
                if all(x == 0 for x in ns):
                    cnt += 1
        
        return cnt
