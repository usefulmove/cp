from itertools import chain

def flatten(nested_list):
    for item in nested_list:
        if isinstance(item, list):
            yield from flatten(item)
        else:
            yield item

class Solution:
    def separateDigits(self, nums: List[int]) -> List[int]:
        chrs = flatten(list(str(n)) for n in nums)
        digs = [int(c) for c in chrs]
        return digs
