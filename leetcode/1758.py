class Solution:
    def minOperations(self, s: str) -> int:
        n = len(s)

        cnt = 0
        pattern = True

        while s:
            if bool(int(s[0])) == pattern:
                cnt += 1
            s = s[1:]
            pattern = not pattern

        return min(cnt, n - cnt)


#class Solution:
#    def minOperations(self, s: str) -> int:
#        def compare(
#            comp: str,
#            pattern: bool = True,
#            cnt: int = 0,
#        ) -> int:
#            if not comp:
#                return min(cnt, len(s) - cnt)
#            bit_bool = bool(int(comp[0]))
#            return compare(
#                comp[1:],
#                not pattern,
#                cnt + bit_bool == pattern,
#            )
#
#        return compare(s)


#class Solution:
#    def minOperations(self, s: str) -> int:
#        def compare(
#            comp: str,
#            pattern: bool = True,
#            cnt_a: int = 0,
#            cnt_b: int = 0,
#        ) -> int:
#            if not comp:
#                return min(cnt_a, cnt_b)
#            bit_bool = bool(int(comp[0]))
#            return compare(
#                comp[1:],
#                not pattern,
#                cnt_a + bool(bit_bool == pattern),
#                cnt_b + bool(bit_bool != pattern),
#            )
#
#        return compare(s)


#class Solution:
#    def minOperations(self, s: str) -> int:
#        pattern_a = "".join('0' if i % 2 else '1' for i, _ in enumerate(s))
#        pattern_b = "".join('1' if i % 2 else '0' for i, _ in enumerate(s))
#
#        def diff(s_one: str, s_two: str, acc: int = 0) -> int:
#            if not s_one:
#                return acc
#            return diff(
#                s_one[1:],
#                s_two[1:],
#                acc + 1 if s_one[0] == s_two[0] else acc
#            )
#
#        return min(diff(s, pattern_a), diff(s, pattern_b))
