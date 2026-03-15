class Solution:
    def countCommas(self, n: int) -> int:
        return len([1 for a in range(n + 1) if a > 999])


#class Solution:
#    def countCommas(self, n: int) -> int:
#        cnt = 0
#        for a in range(n + 1):
#            cnt += 0 if a < 1_000 else 1
#        return cnt


#class Solution:
#    def countCommas(self, n: int) -> int:
#        cnt = 0
#        for a in range(n+1):
#            cnt += f"{a:,}".count(',')
#        return cnt
