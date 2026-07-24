class Solution:
    def rearrangeString(self, s: str, x: str, y: str) -> str:
        no_ys = [c for c in s if c != y] # filter ys out of s
        return (len(s) - len(no_ys)) * y + "".join(no_ys)
