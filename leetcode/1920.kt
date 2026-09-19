class Solution {
    fun buildArray(nums: IntArray): IntArray = nums
        .map {nums[it]}
        .toIntArray()
}
