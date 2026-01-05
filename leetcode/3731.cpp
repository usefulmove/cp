#include <algorithm>
#include <ranges>
#include <vector>

class Solution {
  public:
    std::vector<int> findMissingElements(std::vector<int> &nums) {
        std::vector<int> out;
        const auto [min, max] = std::ranges::minmax(nums);

        return std::ranges::fold_left(
            std::views::iota(min, max + 1),
            out,
            [&nums](std::vector<int> acc, int num) {
                if (std::find(nums.begin(), nums.end(), num) == nums.end()) {
                    acc.push_back(num);
                }

                return acc;
            }
        );
    }
};

int main() { return 0; }
