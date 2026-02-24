class Solution:
    def scoreDifference(self, nums: List[int]) -> int:
        score_diff = 0
        one_active = True

        for i, game in enumerate(nums):
            if 0 == (i + 1) % 6:
                one_active = not one_active
            if 1 == game % 2: # odd
                one_active = not one_active
            score_diff += game if one_active else -game

        return score_diff
