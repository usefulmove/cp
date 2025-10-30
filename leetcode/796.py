class Solution:
    def rotateString(self, s: str, goal: str, tries: int = 0) -> bool:
        if tries == len(s):
            return False

        test: str = s[1:] + s[0]

        if test == goal:
            return True

        return self.rotateString(test, goal, tries + 1)
