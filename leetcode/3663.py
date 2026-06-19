class Solution:
    def getLeastFrequentDigit(self, n: int) -> int:
        cnts = Counter(str(n))
        min_cnt = min(cnts.values())
        return min(int(dig) for dig, cnt in cnts.items() if cnt == min_cnt)
