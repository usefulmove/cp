class Solution:
    def maxContainers(self, n: int, w: int, maxWeight: int) -> int:
        allowedBySpace: int = n * n
        allowedByWeight: int = maxWeight // w

        return min(allowedBySpace, allowedByWeight)
