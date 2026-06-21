export const compute = (strand_a, strand_b) => {
    if (strand_a.length != strand_b.length) {
	throw new Error("strands must be of equal length");
    }
    return [...strand_a].reduce((acc, a, i) => {
        return acc + ((a === strand_b[i]) ? 0 : 1);
    }, 0);
};
