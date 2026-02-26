package pangram

import "core:strings"

is_pangram :: proc(str: string) -> bool {
    Rune_Set :: bit_set['a'..='z'] 
    set: Rune_Set = {}

    strlower := strings.to_lower(str)
    defer delete(strlower)

    for c in strlower {
        if c >= 'a' && c <= 'z' {
            set += { c }
        }
    }

	return 26 == card(set)
}
