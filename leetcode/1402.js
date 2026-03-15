/**
 * @param {number[]} satisfaction
 * @return {number}
 */
const maxSatisfaction = (satisfaction) => {
  const increasing = (a, b) => a - b;
  const sortedSatisfaction = satisfaction.sort(increasing);
  return sortedSatisfaction.reduce(
    (max, _, i, arr) => Math.max(max, sumSatisfaction(arr.slice(i))),
    0,
  );
};

const sumSatisfaction = (satisfaction) =>
  satisfaction.reduce((sum, a, i) => sum + (i + 1) * a, 0);
