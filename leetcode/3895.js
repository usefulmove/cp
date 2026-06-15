/**
 * @param {number[]} nums
 * @param {number} digit
 * @return {number}
 */
var countDigitOccurrences = function(nums, digit) {
    const sdig = digit.toString();
    let count = 0;
    for (const n of nums) {
        for (const c of n.toString()) {
            if (c === sdig) {
                count += 1;
            }
        }
    }
    return count;
};
