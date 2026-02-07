class Solution:
    def reverseByType(self, s: str) -> str:
        partition = ([], [])

        for c in s:
            partition[c.isalpha()].append(c)

        chars, letters = partition
        rletters = reversed(letters)
        rchars = reversed(chars)

        out = ""
        for c in s:
            if c.isalpha():
                out = out + next(rletters)
            else:
                out = out + next(rchars)

        return out
