class Solution {
  public:
    int repeatedNTimes(vector<int> &nums) {
        int n = nums.size() >> 1;

        for (int num : nums) {
            if ((ranges::count(nums, num)) == n) {
                return num;
            }
        }

        return -1;
    }
};
