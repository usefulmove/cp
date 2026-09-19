class Solution {
    fun canConstruct(ransomNote: String, magazine: String): Boolean {
        if (ransomNote.isEmpty()) return true
        
        val c: Char = ransomNote[0]
        val rest: String = ransomNote.drop(1)

        return when {
            c in magazine -> {
                canConstruct(rest, magazine.replaceFirst(Regex(c.toString()), ""))
            }
            else -> false
        }
    }
}
