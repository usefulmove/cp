/**
 * @param {number} n
 * @param {number} x
 * @return {boolean}
 */
var validDigit = function(n, x) {
    sn = n.toString();    
    sx = x.toString();
    return sn.includes(sx) && sx != sn[0];
};
