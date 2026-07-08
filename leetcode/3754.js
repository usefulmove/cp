/**
 * @param {number} n
 * @return {number}
 */
var sumAndMultiply = function(n) {
    let recur = (num, base = 0, m = 1, mult = 0) => {
        if (num === 0) {
            return base * mult;
	}
	
	let quot = Math.trunc(num / 10);
        let rem = num % 10;

	if (rem === 0) {
            return recur(quot, base, m, mult);
        }

        return recur(quot, base + rem * m, m * 10, mult + rem);
    }
    return recur(n);
};
