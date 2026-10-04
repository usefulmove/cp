/**
 * @param {number[]} nums
 * @return {number}
 */
const arraySign = (nums) =>
  nums.reduce((prod, a) => prod * Math.sign(a), 1);
