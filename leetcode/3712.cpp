class Solution {
  public:
    int sumDivisibleByK(const vector<int> &nums, const int &k) {
        std::array<int, 101> cnts = {0};

        for (const int &n : nums) {
            cnts[n]++;
        }

        return std::ranges::fold_left(std::ranges::views::enumerate(cnts), 0,
                                      [k](const int acc, const auto pair) {
                                          const auto [n, cnt] = pair;

                                          if ((cnt != 0) && (cnt % k == 0))
                                              return acc + int(n) * cnt;

                                          return acc;
                                      });
    }
};
