class Solution {
    fun numberOfSpecialChars(word: String): Int {
        val lowers = word.filter({ it == it.lowercaseChar() })
        val matchingUppers = lowers.filter({ it.uppercaseChar() in word })
        return matchingUppers.toList().distinct().size
    }
}
