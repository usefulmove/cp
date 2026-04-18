class Solution:
    def findDegrees(self, matrix: list[list[int]]) -> list[int]:
        out = [0] * len(matrix)
        for row in matrix:
            for i, e in enumerate(row):
                out[i] += e
        return out
