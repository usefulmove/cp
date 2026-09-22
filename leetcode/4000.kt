class Solution {
    fun largestInteger(n: Int, s: Int): Int {
        fun digitSum(n: Int): Int {
            var rest = n
            var sum = 0
            while (rest != 0) {
                val dig = rest % 10
                sum += dig
                rest = rest / 10
            }
            return sum
        }

        val maximum = "9".repeat(n).toInt()

        for (n in maximum downTo 0) {
            if (digitSum(n) == s) return n
        }

        return -1
    }
}
