#include "collatz_conjecture.h"

static int steps_counter(int start, int count) {
  if (start < 1) {
    return ERROR_VALUE;
  }

  if (start == 1) {
    return count;
  }

  return (0 == (start % 2))
    ? steps_counter(start / 2, count + 1)
    : steps_counter((3 * start) + 1, count + 1);
}

int steps(int start) {
  return steps_counter(start, 0);
}
