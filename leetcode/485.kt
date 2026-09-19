class Solution {
    fun findMaxConsecutiveOnes(nums: IntArray): Int {
        val ones: List<String> = nums
            .joinToString("")
            .split("0")
        return ones
            .map({ it.length })
            .maxOrNull()!!
    }

    /*
    fun findMaxConsecutiveOnes(nums: IntArray): Int {
        fun loop(ns: List<Int>, cnt: Int = 0, maxCnt: Int = 0): Int = when {
            ns.size == 0 -> maxCnt
            ns[0] == 1 -> loop(ns.drop(1), cnt + 1, max(maxCnt, cnt + 1))
            else -> loop(ns.drop(1), 0, maxCnt)
        }
        return loop(nums.toList())
    }
     */
}
