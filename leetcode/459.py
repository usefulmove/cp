class Solution:
    def repeatedSubstringPattern(self, s: str) -> bool:
        halfLen: int = len(s) // 2

        def doesRepeat(sub: str, st: str) -> bool:
            reduced: str = st.replace(sub, "")

            if reduced == "": # comp. reduced
                return True
            elif reduced == st: # doesn't reduce
                return False
            else:
                return doesRepeat(sub, reduced)

        def loop(subLen: int = 0):
            if subLen > halfLen:
                return False
            else:
                return doesRepeat(s[:subLen], s) or loop(subLen + 1)

        return loop()
