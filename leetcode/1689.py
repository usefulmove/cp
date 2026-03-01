class Solution:
    def minPartitions(self, n: str) -> int:
        for a in range(9, 0, -1):
            if str(a) in n:
                return a
        return 0

#class Solution:
#    def minPartitions(self, n: str) -> int:
#        return int(max(n))

#class Solution:
#    def minPartitions(self, n: str) -> int:
#        return max(int(c) for c in n)
