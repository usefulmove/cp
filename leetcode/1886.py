class Solution:
    def findRotation(self, mat: List[List[int]], target: List[List[int]]) -> bool:
        def rotate(m):
            return [list(row)[::-1] for row in zip(*m)]

        check_mat = mat
        for _ in range(4):
            if check_mat == target:
                return True
            check_mat = rotate(check_mat)

        return False
