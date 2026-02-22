package leap

is_leap_year :: proc(year: int) -> bool {
    return (0 == year % 400) || ((0 == year % 4) && (0 != year % 100))
}
