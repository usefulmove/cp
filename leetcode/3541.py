from collections import Counter

class Solution:
    def maxFreqSum(self, s: str) -> int:
        counts = list(Counter(s).items())

        def recur(cnts, maxVowel = 0, maxConsonant = 0):
            if not cnts:
                return maxVowel + maxConsonant

            char, cnt = cnts[0]

            if char in "aeiou":
                return recur(cnts[1:], max(maxVowel, cnt), maxConsonant)
            else:
                return recur(cnts[1:], maxVowel, max(maxConsonant, cnt))

        return recur(counts)
