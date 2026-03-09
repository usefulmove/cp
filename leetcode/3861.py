class Solution:
    def minimumIndex(self, capacity: list[int], itemSize: int) -> int:
        min_idx = -1
        min_cap = 101
        for i, cap in enumerate(capacity):
            room = cap-itemSize
            if room < 0:
                continue
            if room < min_cap:
                min_idx, min_cap = i, room
        
        return min_idx


#class Solution:
#    def minimumIndex(self, capacity: list[int], itemSize: int) -> int:
#        residual_capacities = [c-itemSize for c in capacity]
#
#        min_idx = -1
#        min_cap = 101
#        for i, cap in enumerate(residual_capacities):
#            if cap < 0:
#                continue
#            if cap < min_cap:
#                min_idx, min_cap = i, cap
#        
#        return min_idx
