/**
 * @param {number[]} nums
 * @param {number} pivot
 * @return {number[]}
 */
var pivotArray = function(nums, pivot) {
    let ls = [];
    let es = [];
    let ms = [];

    nums.forEach(n => {
        ((n < pivot) ? ls : ((n === pivot) ? es : ms)).push(n)
    });

    return ls.concat(es).concat(ms);
};
