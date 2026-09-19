class Solution {
    fun topKFrequent(nums: IntArray, k: Int): IntArray {
        val cnts: MutableMap<Int, Int> = mutableMapOf()

        for (n in nums)
            cnts[n] = cnts.getOrDefault(n, 0) + 1

        return cnts.toList() // List<Pair<Int, Int>>
                   .sortedByDescending { it.second }
                   .map { it.first }
                   .take(k)
                   .toIntArray()
    }
}
