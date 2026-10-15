class Solution {
    fun sumCounts(nums: List<Int>): Int {
        var distinctSumOfSquares = 0
        for (i in nums.indices)
            for (j in i..nums.lastIndex) {
                val distinctCount =
                     nums
                        .slice(i..j)
                        .distinct()
                        .count()
                distinctSumOfSquares += distinctCount * distinctCount
            }
        return distinctSumOfSquares
    }
}
