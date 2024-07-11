import re

def reverseParentheses(s):
    pattern = "\\(([a-z]*?)\\)"

    def edit(match):
        s = match.group(1)
        return s[::-1]

    return reverseParentheses(re.sub(pattern, edit, s)) if "(" in s else s

reverseParentheses("(abcd)")
reverseParentheses("(u(love)i)")
reverseParentheses("(ed(et(oc))el)")
reverseParentheses("vdgzyj()")
