class Solution {
  public:
    int repeatedNTimes(vector<int> &nums) {
        int n = nums.size() >> 1;

        for (int num : nums) {
            auto filtered =
                nums | views::filter([num](int elem) { return elem == num; });

            if (ranges::distance(filtered) == n) {
                return num;
            }
        }

        return -1;
    }
};
