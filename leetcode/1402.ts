const maxSatisfaction = (satisfaction: number[]): number => {
  const increasing = (a: number, b: number): number => a - b;
  const sortedSatisfaction: number[] = satisfaction.sort(increasing);
  return [...sortedSatisfaction].reduce(
    (max, _, i, arr) => Math.max(max, sumSatisfaction(arr.slice(i))),
    0,
  );
};

const sumSatisfaction = (satisfaction: number[]): number =>
  satisfaction.reduce((sum: number, a: number, i: number): number => sum + (i + 1) * a, 0);
