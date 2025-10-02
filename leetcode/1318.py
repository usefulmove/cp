class Solution:
    def minFlops(self, a: int, b: int, c: int) -> int:
        a_bits = f"{a:0>32b}"
        b_bits = f"{b:0>32b}"
        c_bits = f"{c:0>32b}"
        aorb_bits = f"{a|b:0>32b}"

        def f(acc, tup):
            a, b, c, aorb = tup

            if aorb == c:
                return acc
            elif aorb == '0' or a == '0' or b == '0':
                return acc + 1
            else:
                return acc + 2

        return reduce(f, zip(a_bits, b_bits, c_bits, aorb_bits), 0)
