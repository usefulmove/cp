class Solution:
    def binaryGap(self, n: int) -> int:
        bs: str = bin(n)[2:].strip('0')
        
        def recur(bits: str, gap: int = 0, max_gap: int = 0) -> int:
            if not bits:
                return max_gap

            max_gap = max(gap, max_gap)

            bit, *rest = bits

            match bit:
                case '0':
                    gap += 1
                case '1':
                    gap = 1

            return recur(rest, gap, max_gap)

        return recur(bs)
