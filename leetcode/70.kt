class Solution {
    fun climbStairs(n: Int): Int {
        tailrec fun fib(
            n: Int,
            a: Int,
            b: Int,
        ): Int =
            when (n) {
                0 -> a
                1 -> b
                else -> fib(n - 1, b, a + b)
            }
        return fib(n + 1, 0, 1)
    }
}
