package grains

import "core:math"

Error :: enum {
	None = 0,
	InvalidSquare,
	Unimplemented,
}

// Returns the number of grains on the specified square.
square :: proc(n: int) -> (u64, Error) {
    if n < 1 || n > 64 { return 0, .InvalidSquare }
    return u64(math.pow_f64(2, f64(n - 1))), .None
}

// Returns the total number of squares on the board.
total :: proc() -> (u64, Error) {
    total_grains: u64
    for n in 1..=64 {
        grains, err := square(n)
        if err == Error.None { total_grains += grains }
    }
	return total_grains, .None
}
