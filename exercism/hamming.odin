package hamming

Error :: enum {
	None,
	UnequalLengths,
	Unimplemented,
}

distance :: proc(strand1, strand2: string) -> (int, Error) {
    if len(strand1) != len(strand2) {
        return 0, .UnequalLengths
    }

	differences: int
    for _, i in strand1 {
        if strand1[i] != strand2[i] { differences += 1 }
    }
    
	return differences, .None
}
