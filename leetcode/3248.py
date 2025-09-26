class Solution:
    def finalPositionOfSnake(self, n: int, commands: List[str]) -> int:
        def f(pos,cmd):
            match cmd:
                case "UP":
                    return pos - n
                case "DOWN":
                    return pos + n
                case "RIGHT":
                    return pos + 1
                case "LEFT":
                    return pos - 1

        return reduce(f, commands, 0)
