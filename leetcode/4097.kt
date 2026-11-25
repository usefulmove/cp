class Solution {
    fun minMergedInteger(nums: IntArray): Int {
        var minValue = Int.MAX_VALUE
        for (i in 0..nums.lastIndex-1 step 2) {
            minValue = min(
                minValue,
                (nums[i].toString() + nums[i+1].toString()).toInt(),
            )
        }
        return minValue
    }
}
