class Solution:
    def removeOuterParentheses(self, s: str, depth = 0, out = '') -> str:
        if not s:
            return out

        match s[0], depth:
            case '(', 0: # outermost
                return self.removeOuterParentheses(s[1:], depth + 1, out)
            case ')', 1: # outermost
                return self.removeOuterParentheses(s[1:], depth - 1, out)
            case '(', _:
                return self.removeOuterParentheses(s[1:], depth + 1, out + '(')
            case _:
                return self.removeOuterParentheses(s[1:], depth - 1, out + ')')
