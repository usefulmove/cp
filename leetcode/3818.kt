class Solution {
    fun minimumPrefixLength(nums: IntArray): Int {
        val strictSize =
            nums
                .toList()
                .zipWithNext()
                .map { it.first < it.second }
                .reversed()
                .takeWhile { it }
                .size + 1
        return nums.size - strictSize
    }
}

/*
class Solution {
    fun minimumPrefixLength(nums: IntArray): Int {
        fun countIncreasing(xs: List<Int>, count: Int = 1): Int {
            return when {
                xs.size < 2 -> count
                xs[0] <= xs[1] -> count
                else -> countIncreasing(xs.drop(1), count + 1)

            }
        }

        return nums.size - countIncreasing(nums.reversed())
    }
}
 */
