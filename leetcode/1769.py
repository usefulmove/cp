class Solution:
    def minOperations(self, boxes: str) -> List[int]:
        def ops(i: int) -> int:
            out = 0
            for j in range(len(boxes)):
                if boxes[j] == '1':
                    out += abs(i - j)
            return out

        return [ops(i) for i, _ in enumerate(boxes)]


#class Solution:
#    def minOperations(self, boxes: str) -> List[int]:
#        n = len(boxes)
#        out = [0] * n
#        for i in range(n):
#            for j in range(n):
#                if boxes[j] == '1':
#                    out[i] += abs(i - j)
#        return out
