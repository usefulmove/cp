#include "difference_of_squares.h"

namespace difference_of_squares {
    int square_of_sum(int n) {
        int sum = 0;
        for (int a = 1; a <= n; a++) {
            sum += a;
        }
        return sum * sum;
    }

    int sum_of_squares(int n) {
        int sum = 0;
        for (int a = 1; a <= n; a++) {
            sum += a * a;
        }
        return sum;    
    }

    int difference(int n) {
        return square_of_sum(n) - sum_of_squares(n);
    }
}  // namespace difference_of_squares
