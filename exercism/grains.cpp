#include "grains.h"
#include <cmath>

namespace grains {
    unsigned long long square(unsigned long long n) {
        return std::pow(2, n - 1);
    }

    unsigned long long total() {
        unsigned long long sum = 0;

        for (unsigned long long a = 1; a <= 64; a++) {
            sum += square(a);
        }
        
        return sum;
    }
}  // namespace grains
