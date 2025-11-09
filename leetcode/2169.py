class Solution:
    def countOperations(self, num1: int, num2: int) -> int:
        def recur(a, b, ops = 0):
            if a == 0 or b == 0:
                return ops
            elif a >= b:
                return recur(a-b, b, ops+1)
            else:
                return recur(a, b-a, ops+1)

        return recur(num1, num2)
