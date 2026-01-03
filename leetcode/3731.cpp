#include <algorithm>
#include <ranges>
#include <vector>

class Solution {
public:
  vector<int> findMissingElements(vector<int> &nums) {
    vector<int> out;

    auto min = min_element(nums.begin(), nums.end());
    auto max = max_element(nums.begin(), nums.end());

    for (int num : views::iota(*min, *max + 1)) {
      if (find(nums.begin(), nums.end(), num) == nums.end()) {
        out.push_back(num);
      }
    }

    return out;
  }
};

int main() { return 0; }
