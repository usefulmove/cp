class Solution:
    def countBinarySubstrings(self, s: str) -> int:
        def is_binary(s):
            n = len(s)

            if not s or  n % 2 == 1:
                return False

            if s[0] == s[-1]:
                return False

            h = n // 2
            start_same = all(bit == s[0] for bit in s[:h]) 
            end_same = all(bit == s[-1] for bit in s[h:])

            if start_same and end_same:
                return True

            return False

        cnt = 0

        for i in range(len(s)):
            for j in range(i + 1, len(s) + 1):
                if is_binary(s[i:j]):
                    cnt += 1

        return cnt
