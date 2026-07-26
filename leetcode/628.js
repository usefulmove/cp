/**
 * @param {number[]} nums
 * @return {number}
 */
var maximumProduct = function(nums) {
    let max = Number.MIN_SAFE_INTEGER;
    let copy = nums;
    copy.sort((a, b) => a - b);

    if (copy.length > 6) {
        copy = copy.slice(0, 3).concat(copy.slice(-3))
    }
    
    const len = copy.length;

    for (let a = 0; a < len - 2; a++) {
        for (let b = a + 1; b < len - 1; b++) {
            for (let c = b + 1; c < len; c++) {
                max = Math.max(max, copy[a] * copy[b] * copy[c]);
            }
        }
    }
    return max;
};

//        var max = Int.MinValue
//        for (a <- 0 until nums.length - 2) {
//            for (b <- a + 1 until nums.length - 1) {
//                for (c <- b + 1 until nums.length) {
//                    max = max.max(nums(a) * nums(b) * nums(c))
//                }
//            }
//        }
//        max
