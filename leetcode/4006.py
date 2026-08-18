class Solution:
    def countValidPrefixes(self, s: str) -> int:
        cnt = ones = zeros = 0

        for b in s:
            match b:
                case '0':
                    zeros += 1
                case '1':
                    ones += 1
            if abs(ones - zeros) < 2:
                cnt += 1
        
        return cnt
