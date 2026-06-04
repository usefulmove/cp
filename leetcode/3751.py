class Solution:
    def totalWaviness(self, num1: int, num2: int) -> int:
        cnt = 0
        for num in range(num1, num2 + 1):
            digs = str(num)
            n_digs = len(digs)
            if n_digs < 3:
                continue
            for i in range(1, n_digs-1):
                d = digs[i]
                if (d < digs[i-1] and d < digs[i+1]) or (d > digs[i-1] and d > digs[i+1]):
                    cnt += 1
        return cnt
