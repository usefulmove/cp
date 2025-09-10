class Solution:
    def reverseDegree(self, s: str) -> int:
        def value(c: str) -> int:
            return 123 - ord(c)

        def recur(cs: str, ind: int, degree: int) -> int:
            if cs == "":
                return degree
            else:
                return recur(cs[1:], ind + 1, degree + (ind * value(cs[0])))

        return recur(s, 1, 0)
