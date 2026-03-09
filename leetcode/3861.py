class Solution:
    def minimumIndex(self, capacity: list[int], itemSize: int) -> int:
        residual_capacities = [c-itemSize for c in capacity]

        idx = -1
        minimum_capacity = 101
        for i, cap in enumerate(residual_capacities):
            if cap < 0:
                continue
            if cap < minimum_capacity:
                idx, minimum_capacity = i, cap
        
        return idx
