class Solution {
    tailrec fun isHappy(n: Int, seen: Set<Int> = setOf()): Boolean =
        when (n) {
            1 -> true
            in seen -> false
            else -> isHappy(process(n), seen + n)
        }

    private tailrec fun process(n: Int, acc: Int = 0): Int {
        if (n == 0) return acc
        val (dig, quotient) = Pair(n % 10, n / 10)
        return process(quotient, acc + dig * dig)
    }
}
