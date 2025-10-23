class Solution:
    def hasSameDigits(self, s: str) -> bool:
        if len(s) == 2:
            return s[0] == s[1]

        def process(s: str, acc: str = '') -> str:
            if len(s) <= 1:
                return acc

            acc_n = acc + str((int(s[0]) + int(s[1])) % 10)
            s_n = s[1:]

            return process(s_n, acc_n)

        return self.hasSameDigits(process(s))
