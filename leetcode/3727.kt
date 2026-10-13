class Solution {
    fun maxAlternatingSum(nums: IntArray): Long {
        val sumOfSquares = fun (ns: List<Int>): Long =
            ns.fold(0L) { acc, n -> acc + n * n }
        val snums: List<Int> = nums.sortedByDescending { abs(it) }
        val half = (nums.size + 1) / 2
        val bigs = snums.slice(0..<half)
        val smalls = snums.slice(half..snums.lastIndex)
        return sumOfSquares(bigs) - sumOfSquares(smalls)
    }
}
