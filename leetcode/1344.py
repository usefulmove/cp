class Solution:
    def angleClock(self, hour: int, minutes: int) -> float:
        min_ang = 6 * minutes
        hour_ang = 30 * (hour % 12) + min_ang / 12
        diff = abs(hour_ang - min_ang)
        return min(diff, 360 - diff)
