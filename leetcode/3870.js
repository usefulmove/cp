/**
 * @param {number} n
 * @return {number}
 */
var countCommas = n => (n < 1000) ? 0 : n - 999;

//var countCommas = function(n) {
//    if (n < 1000) { return 0; }
//    return n - 999;
//};
