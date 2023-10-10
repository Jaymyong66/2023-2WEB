const fact = (x) => {
  let result = 1;
  for (let i = 0; i < x; i++) result *= i + 1;
  return result;
};

// export const permutation = (n, r) => fact(n) / fact(n - r);
// export const combination = (n, r) => permutation(n, r) / fact(r);
// export const multiPermutation = (n, r) => n ** r;
// export const multiCombination = (n, r) => combination(n + r - 1, r);

const permutation = (n, r) => fact(n) / fact(n - r);
const combination = (n, r) => permutation(n, r) / fact(r);
const multiPermutation = (n, r) => n ** r;
const multiCombination = (n, r) => combination(n + r - 1, r);

module.exports = {
  combination,
  permutation,
  multiCombination,
  multiPermutation,
};
