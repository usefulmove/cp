#include "grains.h"

namespace grains {
    uint64_t square(uint64_t n) {
        return 1 << (n - 1);
    }

    uint64_t total() {
        uint64_t sum = 0;
        for (uint64_t a = 1; a <= 64; a++) {
            sum += square(a);
        }
        return sum;
    }
}  // namespace grains
