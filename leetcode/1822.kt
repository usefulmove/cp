class Solution {
    fun arraySign(nums: IntArray): Int =
        nums.fold(1) { acc, n -> when {
                n == 0 -> 0
                n < 0 -> acc * -1
                else -> acc
        }}
}

/*
class Solution {
    fun arraySign(nums: IntArray): Int = when {
        0 in nums -> 0
        else -> if (isEven(nums.count { it < 0 })) 1 else -1 
    }
    private fun isEven(n: Int): Boolean = n and 1 == 0
}
 */
