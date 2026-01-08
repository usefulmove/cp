class Solution {
  public:
    int searchInsert(const vector<int> &nums, const int target) {
        int bottom = 0;
        int top = nums.size();

        while (bottom < top) {
            const int middle = bottom + (top - bottom) / 2;
            const int num = nums[middle];

            if (num < target) {
                bottom = middle + 1;
            } else {
                top = middle;
            }
        }

        return bottom;
    }
};
