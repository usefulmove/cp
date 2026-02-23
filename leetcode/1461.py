class Solution:
    def hasAllCodes(self, s: str, k: int) -> bool:
        codes = set()
        for i in range(len(s) - k + 1):
            codes.add(s[i:i+k])
        return len(codes) == 2**k

#class Solution:
#    def hasAllCodes(self, s: str, k: int) -> bool:
#        for n in reversed(range(2**k)):
#            code = bin(n)[2:].zfill(k)
#            if not code in s:
#                return False
#        return True
