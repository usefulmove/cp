class Solution:
    def checkGoodInteger(self, n: int) -> bool:
        def digitSum(a):
            return sum(map(lambda c: int(c), str(a)))
        def squareSum(a):
            return sum(map(lambda c: int(c)**2, str(a)))
        return squareSum(n) - digitSum(n) >= 50
