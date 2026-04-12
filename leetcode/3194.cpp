#include <algorithm>
#include <climits>

class Solution {
  public:
    double minimumAverage(vector<int>& nums) {
        int len = nums.size();
        std::sort(nums.begin(), nums.end());

        int min_sum = INT_MAX;
        int i = 0;
        while (i <= len-i-1) {
            int sum = nums[i] + nums[len-i-1];
            if (sum < min_sum) { min_sum = sum; }
            i++;
        }

        return min_sum / 2.0;
    }
};
