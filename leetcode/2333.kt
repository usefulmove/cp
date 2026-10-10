class Solution {
    fun minSumSquareDiff(
        nums1: IntArray,
        nums2: IntArray,
        k1: Int,
        k2: Int
    ): Long {
        val diffs: List<Int> =
            nums1.zip(nums2)
                .map { abs(it.first - it.second) }

        tailrec fun prune(nums: List<Int>, times: Int = 1): List<Int> {
            if (times == 0) return nums
            val maxDiff: Int = nums.max()
            if (maxDiff == 0) return nums

            var nums = nums.toMutableList()
            var times = times
            for (i in nums.indices) {
                if (maxDiff == nums[i]) {
                    nums[i] -= 1
                    times -= 1
                    if(times == 0) break
                }
            }

            return prune(nums, times)
        }

        return prune(diffs, k1 + k2)
            .map { it.toLong() }
            .fold(0L)
                { acc, diff -> acc + diff * diff }
    }
}
