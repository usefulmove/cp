class Solution:
    def numWaterBottles(self, numBottles: int, numExchange: int) -> int:
        def loop(empties: int, drunks: int) -> int:
            if empties >= numExchange:
                return loop(empties - numExchange + 1, drunks + 1)
            return drunks

        return loop(numBottles, numBottles)
