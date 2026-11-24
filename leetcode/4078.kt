class Solution {
    fun threeFibonacciSum(n: Int): Boolean {
        fun loop(three: List<Int> = listOf(0, 1, 1)): Boolean {
            val sum = three.sum()
            return when {
                sum == n -> true
                sum > n -> false
                else -> loop(three.drop(1) + three.drop(1).sum())
            }
        }
        return loop()
    }
}
