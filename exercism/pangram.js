export const isPangram = (s) => {
    let asc = (c) => c.toLowerCase().charCodeAt(0);
    let index = (c) => asc(c) - asc('a');
    let isalpha = (c) => {
        let v = asc(c.toLowerCase());
        return (96 < v) && (v < 123);
    };

    // count letters
    let cnts = new Array(26).fill(0);
    for (const c of s) {
        if (isalpha(c)) {
            cnts[index(c)] += 1;
	}
    }

    // return true if all letter counts are non-zero
    return cnts.reduce((acc, cnt) => {
        return acc && cnt != 0;
    }, true);
};

console.log(isPangram("the quick brown fox jumpes over the lazy dog."));
