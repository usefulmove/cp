package difference_of_squares

square_of_sum :: proc(n: int) -> int {
    sum: int
    for a in 1..=n { sum += a }
	return sum * sum
}

sum_of_squares :: proc(n: int) -> int {
    sum: int
    for a in 1..=n { sum += a * a }
	return sum
}

difference :: proc(n: int) -> int {
	return square_of_sum(n) - sum_of_squares(n)
}
