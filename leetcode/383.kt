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

/*
class Solution {
    fun canConstruct(ransomNote: String, magazine: String): Boolean {
        fun loop(rs: List<Char>, ms: List<Char>): Boolean {
            if (rs.isEmpty()) return true
            val c: Char = rs[0]
            val rest: List<Char> = rs.slice(1..rs.lastIndex)
            if (c in ms) return loop(rest, ms - c)
            return false
        }
        return loop(ransomNote.toList(), magazine.toList())
    }
}
 */
