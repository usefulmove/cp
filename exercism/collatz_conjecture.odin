package collatz_conjecture

// Returns the number of steps to get to a value of 1.
steps :: proc(start: int, count: int = 0) -> (result: int, ok: bool) {
    if start <= 0 { return 0, false }
    if start == 1 { return count, true }
    if 0 == start % 2 { return steps(start / 2, count + 1) }
    return steps(3 * start + 1, count + 1)
}
