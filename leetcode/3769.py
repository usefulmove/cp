class Solution:
    def sortByReflection(self, nums: List[int]) -> List[int]:
        def reflect(n):
            return (int(format(f"{n:b}")[::-1]), n)

        return sorted(nums, key=reflect)
