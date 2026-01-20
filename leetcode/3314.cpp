#include <functional>
#include <print>
#include <ranges>
#include <vector>

using namespace std;

vector<int> minBitwiseArray(vector<int> nums) {
    function<int(int)> find_index_solution;

    find_index_solution = [](int n) -> int {
        if (n % 2 == 0) { return -1; }

        for (int o : views::iota(0, n)) {
            if ((o | (o + 1)) == n) {
                return o;
            }
        }

        return -1;
    };

    return nums | views::transform(find_index_solution)
                | ranges::to<vector<int>>();
}

int main() {
    println("{}", minBitwiseArray({2,3,5,7}));  // [-1,1,4,3]
    println("{}", minBitwiseArray({11,13,31})); // [9,12,15]
    return 0;    
}
