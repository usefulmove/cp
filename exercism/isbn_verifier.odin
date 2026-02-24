package isbn_verifier

is_valid :: proc(isbn: string) -> bool {
	sum := 0
	count := 0

	for c in isbn {
		switch c {
		case '-':
			continue
		case '0'..='9':
			if count >= 10 do return false
			sum += int(c - '0') * (10 - count)
			count += 1
		case 'X':
			if count != 9 do return false
			sum += 10
			count += 1
		case:
			return false
		}
	}

	return count == 10 && sum % 11 == 0
}
