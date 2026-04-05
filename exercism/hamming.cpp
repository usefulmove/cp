#include "hamming.h"
#include <stdexcept>

namespace hamming {
int compute(std::string strand_a, std::string strand_b) {
    if (strand_a.length() != strand_b.length()) {
        throw std::domain_error("damn");
    }
    
    int cnt = 0;
    for (long unsigned int i = 0; i <= strand_a.length(); i++) {
        if (strand_a[i] != strand_b[i]) { cnt += 1; }
    }
    return cnt;
}
}  // namespace hamming
