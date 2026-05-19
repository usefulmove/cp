class Solution:
    def getCommon(self, nums1: List[int], nums2: List[int]) -> int:
        if len(nums1) > len(nums2):
            search, base = nums2, nums1
        else:
            search, base = nums1, nums2

        for n in search:
            if n >= base[0] and n in base:
                return n
                
        return -1
