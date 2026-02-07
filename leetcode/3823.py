class Solution:
    def reverseByType(self, s: str) -> str:
        partition = ([], [])

        for c in s:
            partition[c.isalpha()].append(c)

        chars, letters = partition
        rletters_iter = reversed(letters)
        rchars_iter = reversed(chars)

        return "".join(
            next(rletters_iter) if c.isalpha() else next(rchars_iter)
            for c in s
        )
