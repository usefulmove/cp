class Solution {
  public:
    int digitFrequencyScore(int n) {
        int acc = 0;
        for (char c : std::to_string(n)) {
            acc += c - '0';
        };
        return acc;
    }
};
