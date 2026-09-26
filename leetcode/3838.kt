class Solution {
    fun mapWordWeights(words: Array<String>, weights: IntArray): String =
        words
            .map { word ->
                val weight =
                    word
                        .toList()
                        .map { weights[it.toIndex()] }
                        .sum()
                reverseAlphabetLookup(weight)
            }.joinToString("")

    fun Char.toIndex(): Int = this.toInt() - 'a'.toInt()

    fun reverseAlphabetLookup(weight: Int): String {
        val index = 25 - weight % 26
        return (index + 'a'.toInt()).toChar().toString()
    }
}
