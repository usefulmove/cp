package armstrong_numbers

import "core:strconv"

is_armstrong_number :: proc(n: u128) -> bool {
    buf: [64]u8 = ---
    sdigits := strconv.write_u128(buf[:], n, 10)
    power := u128(len(sdigits))

    acc: u128
    base: = n
    for {
        if base == 0 { break }
        acc += pow_u128(base % 10, power)
        base = base / 10
    }
 
	return acc == n
}

pow_u128 :: proc(a: u128, b: u128, acc: u128 = 1)  -> u128 {
    if b == 0 { return acc }
    return acc * a * pow_u128(a, b - 1)
}
