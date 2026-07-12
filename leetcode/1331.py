class Solution:
    def arrayRankTransform(self, arr: List[int]) -> List[int]:
        ranks = {elem:rank for rank, elem in enumerate(sorted(set(arr)), 1)}
        return [ranks[e] for e in arr]
