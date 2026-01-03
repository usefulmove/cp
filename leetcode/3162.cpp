class Solution {
  public:
    int numberOfPairs(vector<int> &nums1, vector<int> &nums2, int k) {
        int count = 0;
        for (int n1 : nums1) {
            for (int n2 : nums2) {
                if (n1 % (n2 * k) == 0) {
                    count += 1;
                }
            }
        }
        return count;
    }
};
