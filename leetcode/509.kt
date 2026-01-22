class Solution {
    fun fib(n: Int): Int {
        fun fib2(n: Int, a: Int, b: Int): Int {
          when (n) {
            0 -> return a
            1 -> return b
            else -> return fib2(n-1, b, a+b)
          }
        }        
        
        return fib2(n, 0, 1)
    }
}
