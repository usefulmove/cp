class Solution {
    fun findWordsContaining(words: Array<String>, x: Char): List<Int> =
        words.indices.filter { x in words[it] }
}

/*
class Solution {
    fun findWordsContaining(words: Array<String>, x: Char): List<Int> =
        words
            .withIndex()
            .filter { x in it.value }
            .map { it.index }
}

class Solution {
    fun findWordsContaining(words: Array<String>, x: Char): List<Int> =
        words.mapIndexedNotNull { ind, word ->
            if (x in word) ind else null
        }
}

class Solution {
    fun findWordsContaining(words: Array<String>, x: Char): List<Int> =
        words
            .withIndex()
            .fold(listOf())
                { acc, (ind, word) -> if (x in word) acc + ind else acc }
}
 */
