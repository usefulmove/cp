class Solution:
    def minMoves(self, target: int, maxDoubles: int, moves: int = 0) -> int:
        if 1 == target:
            return moves
        if 0 == target & 1 and maxDoubles: # even with doubles
            return self.minMoves(target // 2, maxDoubles - 1, moves + 1)
        if 0 == target & 1: # even without doubles
            return self.minMoves(1, 0, moves + target - 1)
        return self.minMoves(target - 1, maxDoubles, moves + 1)
