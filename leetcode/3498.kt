class Solution {
    fun reverseDegree(s: String): Int = s
        .withIndex()
        .fold(0) { acc, (i, c) -> acc + (i + 1) * (26 - c.code + 'a'.code) }
}
