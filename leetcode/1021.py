class Solution:
    def removeOuterParentheses(self, s: str) -> str:
        def recur(cs, depth = 0, out = ''):
            if not cs:
                return out

            match cs[0], depth:
                case '(', 0: # outermost
                    return recur(cs[1:], depth + 1, out)
                case ')', 1: # outermost
                    return recur(cs[1:], depth - 1, out)
                case '(', _:
                    return recur(cs[1:], depth + 1, out + '(')
                case _:
                    return recur(cs[1:], depth - 1, out + ')')

        return recur(s)
