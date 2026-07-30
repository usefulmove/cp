class Solution:
    def internalAngles(self, sides: list[int]) -> list[float]:
        a, b, c = sorted(sides)

        if c >= a + b:
            return []

        def angle(x, y, z):
            num = y*y + z*z - x*x
            den = 2*y*z
            return math.acos(num / den) * 180 / math.pi

        out = []
        out.append(angle(a, b, c))
        out.append(angle(b, c, a))
        out.append(angle(c, a, b))

        return sorted(out)
