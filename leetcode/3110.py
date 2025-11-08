class Solution:
    def scoreOfString(self, s: str) -> int:
        def recur(o: str, acc: int = 0) -> int:
            if not o or len(o) < 2:
                return acc
            return recur(o[1:], acc + abs(ord(o[0]) - ord(o[1])))

        return recur(s)
