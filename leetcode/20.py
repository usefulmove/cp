class Solution:
    def isValid(self, s: str) -> bool:
        return valid_braces(s)


def valid_braces(string):
    current = string
    previous = ""
    while current != previous:
        previous = current
        current = current.replace("()", "")
        current = current.replace("{}", "")
        current = current.replace("[]", "")
        
    return True if len(current) == 0 else False
