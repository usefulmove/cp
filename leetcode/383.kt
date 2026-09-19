class Solution {
    fun canConstruct(ransomNote: String, magazine: String): Boolean {
        val rCounts: Map<Char, Int> = counter(ransomNote)
        val mCounts: Map<Char, Int> = counter(magazine)
        for (c in rCounts.keys)
            if (rCounts.getOrDefault(c, 0) > mCounts.getOrDefault(c, 0))
                return false
        return true
    }

    fun counter(s: String): Map<Char, Int> = s.groupingBy { it }.eachCount()
}

/*
class Solution {
    fun canConstruct(ransomNote: String, magazine: String): Boolean {
        val rCounts: Map<Char, Int> = counter(ransomNote)
        val mCounts: Map<Char, Int> = counter(magazine)
        for (c in rCounts.keys)
            if (rCounts.getOrDefault(c, 0) > mCounts.getOrDefault(c, 0))
                return false
        return true
    }

    fun counter(s: String): Map<Char, Int> {
        val m = mutableMapOf<Char, Int>()
        for (c in s) m[c] = m.getOrDefault(c, 0) + 1
        return m
    }
}

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
