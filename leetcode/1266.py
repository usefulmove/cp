class Solution:
    def minTimeToVisitAllPoints(self, points: List[List[int]]) -> int:
        def cost(point_a, point_b):
            xa, ya = point_a
            xb, yb = point_b
            return max(abs(xb - xa), abs(yb - ya))

        costs = map(lambda pa, pb: cost(pa, pb), points[:-1], points[1:])

        return sum(costs)
