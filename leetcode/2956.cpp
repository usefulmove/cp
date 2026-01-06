class Solution {
  public:
    vector<int> findIntersectionValues(vector<int> &nums1, vector<int> &nums2) {
        int onesintwo =
            std::ranges::fold_left(nums1, 0, [nums2](int acc, int num1) {
                if (std::ranges::contains(nums2, num1))
                    return acc + 1;

                return acc;
            });

        int twosinone =
            std::ranges::fold_left(nums2, 0, [nums1](int acc, int num2) {
                if (std::ranges::contains(nums1, num2))
                    return acc + 1;

                return acc;
            });

        return {onesintwo, twosinone};
    }
};
