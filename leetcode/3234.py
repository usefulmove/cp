class Solution:
    def numberOfSubstrings(self, s: str) -> int:
        cnt = 0
        for i in range(len(s)):
            for j in range(i+1, len(s)+1):
                sub = s[i:j]
                ones = sub.count('1')
                zeros = len(sub) - ones
                if ones >= zeros**2:
                    cnt += 1

        return cnt
