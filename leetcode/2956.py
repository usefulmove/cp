class Solution:
    def findIntersectionValues(self, nums1: List[int], nums2: List[int]) -> List[int]:
        onesInTwo = sum(1 for n1 in nums1 if n1 in nums2)
        twosInOne = sum(1 for n2 in nums2 if n2 in nums1)

        return [onesInTwo, twosInOne]
