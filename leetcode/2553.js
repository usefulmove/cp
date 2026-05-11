/**
 * @param {number[]} nums
 * @return {number[]}
 */
var separateDigits = function(nums) {
  const o = nums.map(a => Array.from(a.toString()));
  const output = o.flat().map(c => parseInt(c));
  return output;
};
