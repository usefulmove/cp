class Solution {
    fun isMiddleElementUnique(nums: IntArray): Boolean {
        val middle: Int = nums[nums.size / 2]
        return nums.count { it == middle } == 1
    }
}
