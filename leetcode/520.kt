class Solution {
    fun detectCapitalUse(word: String): Boolean {
        val cs = word.toList()

        fun isAllUpper(cs: List<Char>): Boolean = cs.all { it == it.uppercaseChar() }

        fun isAllLower(cs: List<Char>): Boolean = cs.all { it == it.lowercaseChar() }

        fun isCapital(cs: List<Char>): Boolean = cs[0] == cs[0].uppercaseChar() && cs.drop(1).all { it == it.lowercaseChar() }
        return isAllUpper(cs) || isAllLower(cs) || isCapital(cs)
    }
}
