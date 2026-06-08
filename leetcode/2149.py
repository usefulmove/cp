class Solution:
    def rearrangeArray(self, nums: List[int]) -> List[int]:
        def partition(predicate, xs):
            ps, ns = [], []

            for x in xs:
                (ps if predicate(x) else ns).append(x)
            
            return ps, ns

        pos, neg = partition(lambda n: n > 0, nums)

        out = []
        for p, n in zip(pos, neg):
            out += [p]
            out += [n]

        return out
