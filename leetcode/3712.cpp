class Solution {
  public:
    int sumDivisibleByK(vector<int> &nums, int k) {
        std::array<int, 101> cnts = {0};

        for (int n : nums) {
            cnts[n] += 1;
        }

        int res = std::ranges::fold_left(std::ranges::views::enumerate(cnts), 0,
                                         [k](int acc, auto ecnt) {
                                             auto [n, cnt] = ecnt;

                                             if ((cnt != 0) && (cnt % k == 0))
                                                 return acc + int(n) * cnt;

                                             return acc;
                                         });

        return res;
    }
};
