class Solution:
    def processStr(self, s: str, res = '') -> str:
        if not s:
            return res

        c, rest = s[0], s[1:]
        match c:
            case '*':
                return self.processStr(rest, res[:-1]) if res else self.processStr(rest, res)
            case '#':
                return self.processStr(rest, res + res)
            case '%':
                return self.processStr(rest, res[::-1])
            case _:
                return self.processStr(rest, res + c)
