class Solution {
  public:
    int minimumDistance(vector<int>& nums) {
        int n = nums.size();
        int base = 200;
        int min_distance = base;

        for (int i = 0; i < (n - 2); i++) {
            for (int j = i + 1; j < (n - 1); j++) {
                for (int k = j + 1; k < n; k++) {
                    if (nums[i] == nums[j] && nums[j] == nums[k]) {
                        min_distance = min(min_distance, (k - i) << 1);
                    }
                }
            }
        }

        return (min_distance == base) ? -1 : min_distance;
    }
};
