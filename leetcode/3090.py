from collections import Counter


class Solution:
    def maximumLengthSubstring(self, s: str) -> int:
        n = len(s)
        cnts = Counter()
        maxLen = 0
        left = right = 0

        cnts[s[right]] += 1
        while right < n:
            # push out right until criterion is exceeded
            while max(cnts.values()) <= 2:
                right += 1
                if right == n:
                    break
                cnts[s[right]] += 1

            maxLen = max(maxLen, right - left)

            # pull in left until criterion is met again
            while max(cnts.values()) > 2:
                cnts[s[left]] -= 1
                left += 1
                if left == n:
                    break

        return maxLen


soln = Solution()
print(f"{soln.maximumLengthSubstring("bcbbbcba") = }") # => 4
print(f"{soln.maximumLengthSubstring("aaaa") = }")     # => 2
