class Solution {
  public:
    int numSub(string s) {
        auto contiguous_ones = s | views::split('0');

        function<long(int)> triangular =
            [](int order) {
                long a = long(order);
                return a * (a + 1) / 2;
            };

        return ranges::fold_left(
            contiguous_ones,
            0,
            [triangular] (int count, auto ones_range) {
                int ones = string_view(ones_range).size();

                return (count + triangular(ones)) % 1000000007;
            }
        );
    }
};
