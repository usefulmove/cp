#include "eliuds_eggs.h"

namespace chicken_coop {
    int positions_to_quantity(int positions) {
        int eggs = 0;
        while (positions != 0) {
            if ((positions & 1) == 1) { eggs += 1; }
            positions >>= 1;
        }
        return eggs;
    }
}  // namespace chicken_coop
