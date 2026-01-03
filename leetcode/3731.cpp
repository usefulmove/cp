#include <algorithm>
#include <ranges>
#include <vector>

class Solution {
public:
  std::vector<int> findMissingElements(std::vector<int> &nums) {
    std::vector<int> out;

    auto min = std::min_element(nums.begin(), nums.end());
    auto max = std::max_element(nums.begin(), nums.end());

    for (int n : std::ranges::views::iota(*min, *max + 1)) {
      if (std::find(nums.begin(), nums.end(), n) == nums.end()) {
        out.push_back(n);
      }
    }

    return out;
  }
};

int main() { return 0; }
