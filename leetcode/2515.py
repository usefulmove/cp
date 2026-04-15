class Solution:
    def closestTarget(self, words: List[str], target: str, startIndex: int) -> int:
        n_words = len(words)

        def shortest_from_here(ind):
            direct = lambda i: abs(startIndex - i)
            left_wrap = lambda i: abs(startIndex + n_words - i)
            right_wrap = lambda i: abs(n_words - startIndex + i)
            
            return min(direct(ind), left_wrap(ind), right_wrap(ind))

        distances = [shortest_from_here(i) for i, word in enumerate(words) if word == target]

        return min(distances) if distances else -1
