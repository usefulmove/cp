class Solution:
    def minFlops(self, a: int, b: int, c: int) -> int:
        a_bits = f"{a:030b}"
        b_bits = f"{b:030b}"
        aorb_bits = f"{a|b:030b}"
        c_bits = f"{c:030b}"

        def f(a, b, c, o):
            if o == c:
                return 0
            elif o == '0' or a == '0' or b == '0':
                return 1
            else:
                return 2

        m = list(map(f, a_bits, b_bits, c_bits, aorb_bits))

        return sum(m)
