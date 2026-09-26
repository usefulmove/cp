class Solution {
    fun scoreOfString(s: String): Int = s
        .zip(s.slice(1..s.lastIndex))
        .fold(0) { acc, (a, b) -> acc + abs(a.toInt() - b.toInt()) }
}
