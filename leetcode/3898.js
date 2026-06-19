/**
 * @param {number[][]} matrix
 * @return {number[]}
 */
var findDegrees = function(matrix) {
    let out = new Array(matrix.length).fill(0);
    for (let i = 0; i < matrix.length; i++) {
        for (let j = 0; j < matrix.length; j++) {
            out[i] += matrix[j][i];
        }
    }
    return out;
};
