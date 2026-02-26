class Solution:
    def numSteps(self, s: str) -> int:
        def reduce(bits: str, steps: int = 0) -> int:
            if bits == "1":
                return steps
            if bits[-1] == '0': # even
                return reduce(bits[:-1], steps + 1)
            else: # odd
                return reduce(add_one(bits), steps + 1)
            

        def add_one(bits: str) -> str:
            def add_helper(bs: str) -> str:
                if not bs:
                    return '1'
                if bs[0] == '0':
                    return "1" + bs[1:]
                else: # '1'
                    return '0' + add_helper(bs[1:])

            return add_helper(bits[::-1])[::-1]


        return reduce(s)
