class Solution {
    fun topKFrequent(
        nums: IntArray,
        k: Int,
    ): IntArray =
        nums
            .asIterable()
            .groupingBy { it }
            .eachCount()
            .entries
            .sortedByDescending { (_, count) -> count }
            .map { (num, _) -> num }
            .take(k)
            .toIntArray()
}

/*
class Solution {
    fun topKFrequent(nums: IntArray, k: Int): IntArray {
        val cnts: MutableMap<Int, Int> = mutableMapOf()

        for (n in nums)
            cnts[n] = cnts.getOrDefault(n, 0) + 1

        return cnts
            .toList()
            .sortedByDescending { (_, count) -> count }
            .map { (num, _) -> num }
            .take(k)
            .toIntArray()
    }
}
 */
