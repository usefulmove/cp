class Solution {
    fun rotatedDigits(n: Int): Int {
        fun rotate(dig: Int): Int? =
            when (dig) {
                0, 1, 8 -> dig
                2, 5 -> if (dig == 2) 5 else 2
                6, 9 -> if (dig == 6) 9 else 6
                else -> null // invalid
            }

        fun rotateDigits(digs: List<Int>): Int? {
            val rots = digs.map { rotate(it) }
            return if (rots.any { it == null }) null
                   else rots.joinToString("").toInt()
        }

        fun isGood(num: Int): Boolean {
            val rotated = rotateDigits(
                num.toString().map { it.toString().toInt() }
            )
            return rotated != null && rotated != num
        }

        return (1..n).filter { isGood(it) }.count()
    }
}
