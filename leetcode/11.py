class Solution:
    def maxArea(self, height: List[int]) -> int:
        most_water: int = 0

        i: int = 0
        j: int = len(height) - 1

        while j > i:
            left_height: int = height[i]
            right_height: int = height[j]

            can_hold: int = min(left_height, right_height) * (j - i)
            most_water = max(most_water, can_hold)

            if left_height < right_height:
                i += 1
            else:
                j -= 1

        return most_water
