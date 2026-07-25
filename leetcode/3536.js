/**
 * @param {number} n
 * @return {number}
 */
var maxProduct = function(n) {
    cs = n.toString().split("").sort((a, b) => b.localeCompare(a));
    return +cs[0] * +cs[1];
};
