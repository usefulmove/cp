class Solution {
  public:
    vector<int> buildArray(vector<int>& nums) {
        return nums
            | std::views::transform([nums](int n) -> int { return nums[n]; })
            | std::ranges::to<vector>();
    }
};
