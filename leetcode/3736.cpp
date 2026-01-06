class Solution {
  public:
    int minMoves(vector<int> &nums) {
        const int max_n = std::ranges::fold_left(
            nums, 0, [](int a, int b) { return std::max(a, b); });

        const int res = std::ranges::fold_left(
            nums, 0, [max_n](int acc, int n) { return acc + max_n - n; });

        return res;
    }
};
