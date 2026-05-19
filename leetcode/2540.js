/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number}
 */
var getCommon = function(nums1, nums2) {
  const set = new Set(nums1);

  for (const n2 of nums2) {
    if (set.has(n2)) {
      return n2;
    }
  }

  return -1;
};
