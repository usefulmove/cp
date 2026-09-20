class Solution {
    fun fib(n: Int): Int {
        tailrec fun fib2(n: Int, a: Int, b: Int): Int = when (n) {
            0 -> a
            1 -> b
            else -> fib2(n - 1, b, a + b)
        }
        return fib2(n, 0, 1)
    }
}
