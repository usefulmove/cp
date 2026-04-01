#include "collatz_conjecture.h"
#include <stdexcept>

namespace collatz_conjecture {
    int helper(int n, int cnt) {
        if (1 == n) {
            return cnt;
        } else {
            if (0 == n % 2) {
                return helper(n / 2, cnt + 1);
            } else {
                return helper(3 * n + 1, cnt + 1);
            }
        }
    }

    int steps(int n) {
        if (n <= 0) {
            throw std::domain_error("Only positive integers are allowed");
        }
        return helper(n, 0);
    }
}  // namespace collatz_conjecture
