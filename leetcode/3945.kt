class Solution {
    fun digitFrequencyScore(n: Int): Int {
        val s = n.toString()
        var sum = 0
        for (c in s) sum += c.digitToInt()
        return sum
    }
}
