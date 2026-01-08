class Solution {
  public:
    int numWaterBottles(int numBottles, int numExchange) {
        auto loop = [numExchange](this auto &&self, int empties,
                                  int drunks) -> int {
            if (empties >= numExchange)
                return self(empties - numExchange + 1, drunks + 1);

            return drunks;
        };

        return loop(numBottles, numBottles);
    }
};
