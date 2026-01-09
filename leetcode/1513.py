class Solution:
    def numSub(self, s: str) -> int:
        contiguous_ones = ( len(ones) for ones in s.split('0') if ones )
        triangular = lambda a: a * (a + 1) // 2
        
        return reduce(
            lambda count, ones: (count + triangular(ones)) % 1000000007,
            contiguous_ones,
            0
        )
