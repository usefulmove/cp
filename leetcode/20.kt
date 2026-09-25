class Solution {
    fun isValid(s: String): Boolean {
        val reduced = s
            .replace("()", "")
            .replace("[]", "")
            .replace("{}", "")
        if (reduced.isEmpty()) return true
        if (reduced == s) return false
        return isValid(reduced)
    }
}
