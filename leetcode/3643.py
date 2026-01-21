class Solution:
    def reverseSubmatrix(self, grid: List[List[int]], x: int, y: int, k: int) -> List[List[int]]:
        row_a = x
        row_b = x + k - 1

        while row_a < row_b:
            for col in range(y, y + k):
                grid[row_a][col], grid[row_b][col] = grid[row_b][col], grid[row_a][col]
            row_a += 1
            row_b -= 1

        return grid
