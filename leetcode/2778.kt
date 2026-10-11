class Solution {
    fun sumOfSquares(nums: IntArray): Int =
        nums.withIndex()
            .filter { (i, _) ->
                nums.size % (i + 1) == 0
            }.fold(0) { acc, (_, num) ->
                acc + num * num
            }
}
