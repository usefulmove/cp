/**
 * @param {number[]} nums
 * @return {number}
 */
const findMaxConsecutiveOnes = nums => {
  const snums = nums.reduce((acc, a) => acc + a.toString(), "");
  const comp = snums.split("0");
  return comp.map(a => a.length).reduce((acc, a) => Math.max(acc, a));
}
