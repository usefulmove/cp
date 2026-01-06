/**
 * @param {number[]} nums
 * @return {number[]}
 */
const smallerNumbersThanCurrent = (nums) => {
    const countLess = (value, array) => array.reduce(
        (sum, a) => {
            (a < value) ? sum += 1 : {};
            return sum;
        },
        0,
    );

    return nums.map((a) => countLess(a, nums));
};
