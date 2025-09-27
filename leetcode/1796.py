class Solution:
    def secondHighest(self, s: str) -> int:
        digits: List[int] = list(set(int(c) for c in s if c.isnumeric()))

        if len(digits) < 2:
            return -1
        else:
            return sorted(digits, reverse=True)[1]
