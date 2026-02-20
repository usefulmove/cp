class Solution:
    def mapWordWeights(self, words: List[str], weights: List[int]) -> str:
        def calculate_weight(word: str) -> int:
            return sum( weights[ord(c) - 97] for c in word ) % 26

        def reverse_lookup(i: int) -> str:
            return chr((25 - i) + 97)

        chars: List[str] = (
            reverse_lookup(calculate_weight(word)) for word in words
        )

        return ''.join(chars)
