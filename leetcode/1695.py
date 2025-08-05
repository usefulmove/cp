class Solution:
    def maximumUniqueSubarray(self, nums: List[int]) -> int:
        # sliding window algorithm
        max_score = 0
        contains = set()
        i, j = 0, 0
        limit = len(nums)
        
        while j < limit:
            a, b = nums[i], nums[j]

            if not b in contains:
                contains.add(b)
                max_score = max(max_score, sum(contains))
                j += 1
            else:
                contains.discard(a)
                i += 1

        return max_score
