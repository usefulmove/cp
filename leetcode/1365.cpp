class Solution {
  public:
    vector<int> smallerNumbersThanCurrent(vector<int> &nums) {
        auto out = std::views::transform(nums, [nums](int n) {
            return std::ranges::fold_left(nums, 0, [nums, n](int sum, int num) {
                if (num < n)
                    return sum + 1;

                return sum;
            });
        });

        return out | std::ranges::to<vector>();
    }
};
