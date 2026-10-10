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
