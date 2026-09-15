class Solution {
    fun maxProduct(nums: IntArray): Int {
        val snums = nums.sortedDescending()
        return (snums[0] - 1) * (snums[1] - 1)
    }
}
