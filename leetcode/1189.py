from collections import Counter

class Solution:
    def maxNumberOfBalloons(self, text: str) -> int:
        counts_balloon = Counter('balloon')
        counts = Counter(text)
        letter_multiples = [
            int(counts[letter]/count) for letter, count in counts_balloon.items()
        ]
        return min(letter_multiples)
