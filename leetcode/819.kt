class Solution {
    fun mostCommonWord(
        paragraph: String,
        banned: Array<String>,
    ): String {
        val delims = "!?',;. ".toCharArray()
        val mostCommon =
            paragraph
                .lowercase()
                .split(*delims)
                .filterNot { it.isEmpty() || it in banned }
                .groupingBy { it }
                .eachCount()
                .maxByOrNull { it.value }

        return mostCommon?.key ?: "" // if (mostCommon != null) mostCommon.key else ""
    }
}

/*
class Solution {
    fun mostCommonWord(paragraph: String, banned: Array<String>): String {
        val delims = "!?',;. ".toCharArray()
        val words = paragraph
            .lowercase()
            .split(*delims)
            .filterNot { it.isEmpty() || it in banned }

        val counts = words
            .groupingBy { it }
            .eachCount()

        val (mostCommonWord, _) = counts.asIterable()
            .fold( mapOf("" to 0).entries.first() )
                { acc, entry -> if (entry.value > acc.value) entry else acc }

        return mostCommonWord
    }
}
 */
