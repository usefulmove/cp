class Solution:
    def hasAlternatingBits(self, n: int) -> bool:
        def is_alternating(bits: str) -> bool:
            if len(bits) < 2:
                return True

            if bits[0] == bits[1]:
                return False

            return is_alternating(bits[1:])

        return is_alternating(bin(n)[2:])
