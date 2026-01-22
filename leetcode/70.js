/**
 * @param {number} n
 * @return {number}
 */
var climbStairs = function(n) {
    function fib2(n, a = 0, b = 1) {
      if (n == 0) {
        return a
      } else if (n == 1) {
        return b
      } else {
        return (fib2(n-1, b, a+b))
      }
    }
    
    return fib2(n+1);
};
