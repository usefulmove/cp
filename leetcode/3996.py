class Solution:
    def canReach(self, start: list[int], target: list[int]) -> bool:
        def isBlack(pos):
            row, col = pos
            return (row + col) % 2 # is sum even?
        # start and end on same color?
        return isBlack(start) == isBlack(target)
