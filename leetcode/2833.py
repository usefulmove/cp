class Solution:
    def furthestDistanceFromOrigin(self, moves: str) -> int:
        def recur(ms: List[str], pos: int = 0):
            if 'L' not in ms and 'R' not in ms:
                return abs(pos) + len(ms)

            move, *rest = ms

            match move:
                case 'L':
                    return recur(rest, pos-1)
                case 'R':
                    return recur(rest, pos+1)
                case '_':
                    return max(
                        recur(['L'] + rest, pos),
                        recur(['R'] + rest, pos),
                    )
                
        return recur(list(moves))
