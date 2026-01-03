#include <algorithm>
#include <ranges>
#include <vector>

class Solution {
  public:
    std::vector<int> findMissingElements(std::vector<int> &nums) {
        std::vector<int> out;

        const auto min = std::min_element(nums.begin(), nums.end());
        const auto max = std::max_element(nums.begin(), nums.end());

        out = std::ranges::fold_left(
            std::views::iota(*min, *max + 1), out,
            [&nums](std::vector<int> acc, int num) {
                if (std::find(nums.begin(), nums.end(), num) == nums.end()) {
                    acc.push_back(num);
                    return acc;
                }

                return acc;
            }
        );

        return out;
    }
};

int main() { return 0; }
