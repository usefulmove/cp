class Solution:
    def findXSum(self, nums: List[int], k: int, x: int) -> List[int]:
        def xsum(ns: List[int]) -> int:
            cnts = Counter(ns)
            tops = sorted(cnts.items(), key=lambda pair: (-pair[1], -pair[0]))[:x]
            return sum(n * cnt for n, cnt in tops)

        return [ xsum(nums[i:i+k]) for i in range(len(nums)-k+1) ]
