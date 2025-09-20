class Solution:
    def minimumMoves(self, s: str) -> int:
        def recur(cs: str, moves: int) -> int:
            if not cs:
                return moves

            if cs[0] == 'X':
                return recur(cs[3:] if len(cs) > 2 else '', moves + 1)
            else:
                return recur(cs[1:], moves)

        return recur(s, 0)
