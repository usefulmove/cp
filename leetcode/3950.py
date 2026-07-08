class Solution:
    def consecutiveSetBits(self, n: int) -> bool:
        b = f"{n:b}"
        return b.find("11") != -1 and b.find("11") == b.rfind("11")
