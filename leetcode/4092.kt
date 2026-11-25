class Solution {
    fun calculateScore(a: Int, b: Int): Int {
        val s1 = setBits(a)
        val s2 = setBits(b)
        return if (s1 >= s2) s1 * s2 else s2 / s1
    }

    fun setBits(num: Int): Int = num.toString(2).count { it == '1' }
}
