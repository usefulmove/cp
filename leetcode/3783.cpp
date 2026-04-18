#include <cmath>

class Solution {
  public:
    int reverse(int n, int acc, bool base_zero) {
        if (n == 0) {
            return acc;
        }

        int quotient = n / 10;
        int digit = n % 10;

        if ((digit == 0) && base_zero) {
            return reverse(quotient, acc, base_zero);
        }

        return reverse(quotient, acc * 10 + digit, false);
    }

    int mirrorDistance(int n) {
        return std::abs(n - reverse(n, 0, true));
    }
};
