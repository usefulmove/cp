class Solution:
    def longestBalanced(self, s: str) -> int:
        longest = 0

        for i in range(len(s)):
            character_counts = {}
            n = 0

            for c in s[i:]:
                n += 1
                if c not in character_counts:
                    character_counts[c] = 1
                else:
                    character_counts[c] += 1

                counts = list(character_counts.values())
                if n > longest and all([cnt == counts[0] for cnt in counts]):
                    longest = n

        return longest
