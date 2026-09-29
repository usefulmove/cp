class Solution {
    fun maxDepth(s: String): Int {
        var depth = 0
        var deepest = 0
        for (c in s) {
            depth += when (c) {
                '(' -> 1
                ')' -> -1
                else -> 0
            }
            deepest = max(depth, deepest)
        }
        return deepest
    }
}
