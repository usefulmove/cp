class Solution:
    def validStrings(self, n: int) -> List[str]:
        bstrings = [ bin(o)[2:].zfill(n) for o in range(2**n) ]

        return filter(lambda s: not("00" in s), bstrings)
