class Solution {
    fun maxAlternatingSum(nums: IntArray): Long {
        val snums: List<Int> = nums.sortedByDescending { abs(it) }
        val half = (nums.size + 1) / 2
        val bigs = snums.slice(0..<half)
        val smalls = snums.slice(half..snums.lastIndex)
        fun List<Int>.sumSquares(): Long =
            this.fold(0L) { acc, a -> acc + a * a }
        return bigs.sumSquares() - smalls.sumSquares()
    }
}

/*
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

class Solution {
    fun maxAlternatingSum(nums: IntArray): Long {
        val snums: List<Int> = nums.sortedByDescending { abs(it) }
        tailrec fun loop(xs: List<Int>, ind: Int = 0, acc: Long = 0L): Long {
            if (xs.isEmpty()) return acc
            if (ind % 2 == 0) {
                val x = xs.first()
                return loop(xs.drop(1), ind + 1, acc + x * x)
            } else {
                val x = xs.last()
                return loop(xs.dropLast(1), ind + 1, acc - x * x)
            }
        }
        val res = loop(snums)
        return res
    }
}
 */
