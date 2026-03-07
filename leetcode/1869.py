class Solution:
    def checkZeroOnes(self, s: str) -> bool:
        def longest_segment(segments: List[str], longest: int = 0):
            if not segments:
                return longest
            return longest_segment(
                segments[1:],
                max(longest, len(segments[0]))
            )

        ones, zeros = s.split('0'), s.split('1')

        return longest_segment(ones) > longest_segment(zeros)
