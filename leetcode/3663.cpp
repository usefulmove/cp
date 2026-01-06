#include <print>

class Solution {
  public:
    int getLeastFrequentDigit(int n) {
        std::array<int, 10> cnts = {0};

        while (n > 0) {
            int digit = n % 10;
            n = n / 10;
            cnts[digit] += 1;
        }

        int lf_digit = 0;
        int minimum = 999;

        for (auto const [dig, cnt] : std::views::enumerate(cnts)) {
            if ((cnt != 0) && (cnt < minimum)) {
                lf_digit = dig;
                minimum = cnt;
            }
        }

        return lf_digit;
    }
};
