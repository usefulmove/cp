from itertools import combinations
from math import sqrt

class Solution:
    def largestTriangleArea(self, points: List[List[int]]) -> float:
        def length(p1, p2):
            return sqrt((p2[0]-p1[0])**2 + (p2[1]-p1[1])**2)
            
        def area(p1, p2, p3):
            a = length(p1, p2)
            b = length(p2, p3)
            c = length(p1, p3)
            s = (a + b + c) * 0.5

            try:
                out = sqrt(s*(s-a)*(s-b)*(s-c))
            except ValueError:
                out = 0

            return out

        combs = combinations(points, 3)

        return max( area(*comb) for comb in combs )
