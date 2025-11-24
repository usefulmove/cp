class Solution:
    def sumAndMultiply(self, n: int) -> int:
        if not n:
            return 0

        def reduce(m, acc = 0):
            if not m:
                return acc

            quot, rem = divmod(m, 10)

            return reduce(quot, acc + rem)


        base = int(str(n).replace('0', ''))

        mult = reduce(base)

        return base * mult
