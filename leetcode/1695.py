class Solution:
    def maximumUniqueSubarray(self, nums: List[int]) -> int:
        # sliding window algorithm
        score, max_score = 0, 0
        i, j = 0, 0
        contains = set()
        limit = len(nums)
        
        while j < limit:
            a, b = nums[i], nums[j]

            if not b in contains:
                contains.add(b)
                score += b
                max_score = max(max_score, score)
                j += 1
            else:
                contains.discard(a)
                score -= a
                i += 1

        return max_score
