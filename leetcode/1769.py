class Solution:
    def minOperations(self, boxes: str) -> List[int]:
        n = len(boxes)
        out = [0] * n
        for i in range(n):
            for j in range(n):
                if boxes[j] == '1':
                    out[i] += abs(i - j)
        return out
