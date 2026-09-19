class Solution {
    fun numberOfSpecialChars(word: String): Int {
        val cs = word
            .toList()
            .distinct()
            .filter { it == it.lowercaseChar() }
        return cs
            .filter { it.uppercaseChar() in word }
            .size
    }
}
