class Solution:
    def minOperations(self, s: str) -> int:
        pattern_a = "".join('0' if i % 2 else '1' for i, _ in enumerate(s))
        pattern_b = "".join('1' if i % 2 else '0' for i, _ in enumerate(s))

        def diff(s_one: str, s_two: str, acc: int = 0) -> int:
            if not s_one:
                return acc
            return diff(
                s_one[1:],
                s_two[1:],
                acc + 1 if s_one[0] == s_two[0] else acc
            )

        return min(diff(s, pattern_a), diff(s, pattern_b))
