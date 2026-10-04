class Solution {
    fun arraySign(nums: IntArray): Int = when {
        0 in nums -> 0
        else -> if (isEven(nums.count { it < 0 })) 1 else -1 
    }
    private fun isEven(n: Int): Boolean = n and 1 == 0
}
