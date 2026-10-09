class Solution {
    fun arrangeWords(text: String): String =
        text.replaceFirstChar { it.lowercase() }
            .split(" ")
            .sortedBy { it.length }
            .joinToString(" ")
            .replaceFirstChar { it.uppercase() }
}
