/**
 * @param {number[]} spells
 * @param {number[]} potions
 * @param {number} success
 * @return {number[]}
 */

/**
 * Binary search to find the first index where potions[index] * spell >= success
 * @param {number[]} potions
 * @param {number} spell
 * @param {number} success
 * @return {number}
 */
const binarySearch = (potions, spell, success) => {
  let left = 0;
  let right = potions.length - 1;

  while (left <= right) {
    const mid = Math.floor((left + right) / 2);
    if (potions[mid] * spell >= success) {
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }

  return left;
};

/**
 * @param {number[]} spells
 * @param {number[]} potions
 * @param {number} success
 * @return {number[]}
 */
const successfulPairs = (spells, potions, success) => {
  const sortedPotions = potions.slice().sort((a, b) => a - b);

  return spells.map(spell => {
    const firstSuccessfulIndex = binarySearch(sortedPotions, spell, success);
    return sortedPotions.length - firstSuccessfulIndex;
  });
};
