class Solution:
    def countValidPrefixes(self, s: str) -> int:
        cnt = 0
        ones = 0
        zeros = 0

        for bit in s:
            match bit:
                case '0':
                    zeros += 1
                case '1':
                    ones += 1
            
            if abs(ones - zeros) < 2:
                cnt += 1
        
        return cnt
