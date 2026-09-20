class Solution {
    fun reversePrefix(
        s: String,
        k: Int,
    ): String = s.substring(0, k).reversed() + s.substring(k)
}
