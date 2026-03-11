class Solution:
    def bitwiseComplement(self, n: int) -> int:
        bits = bin(n)[2:]
        comp = "".join('1' if bit == '0' else '0' for bit in bits)
        return int(comp, 2)
