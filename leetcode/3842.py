class Solution:
    def toggleLightBulbs(self, bulbs: list[int]) -> list[int]:
        def f(acc, b):
            if b in acc:
                acc.remove(b)
                return acc

            acc.add(b)
            return acc

        out = reduce(f, bulbs, set())

        return sorted(list(out))
