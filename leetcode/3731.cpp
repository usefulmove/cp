class Solution {
public:
    vector<int> findMissingElements(vector<int>& nums) {
        vector<int> out;

        auto min = std::min_element(nums.begin(), nums.end());
        auto max = std::max_element(nums.begin(), nums.end());

        for (int n = *min; n <= *max; n++) {
            if (find(nums.begin(), nums.end(), n) == nums.end()) {
                out.push_back(n);
            }
        }

        return out;
    }
};
