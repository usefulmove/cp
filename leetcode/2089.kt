class Solution {
    fun targetIndices(nums: IntArray, target: Int): List<Int> =
        nums.sorted()
            .withIndex()
            .fold(listOf<Int>())
                { acc, (i, n) -> if (n == target) acc + i else acc }
}
