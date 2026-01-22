class Solution {
    fun climbStairs(n: Int): Int {
        fun fib(n: Int, a: Int, b: Int): Int {
          when (n) {
            0 -> return a
            1 -> return b
            else -> return fib(n-1, b, a+b)
          }
        }
        
        return fib(n+1, 0, 1)
    }
}
