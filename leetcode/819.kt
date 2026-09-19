class Solution {
    fun mostCommonWord(paragraph: String, banned: Array<String>): String {
        val delims = "!?',;. ".toCharArray()
        val words = paragraph.lowercase()
                             .split(*delims)
                             .filterNot { it.isEmpty() || it in banned }

        val counts = words.groupingBy { it }
                          .eachCount()

        val e: Map.Entry<String, Int> =
            counts.asIterable()
                  .fold(mapOf("" to 0).entries.first()) {
                      acc: Map.Entry<String, Int>, entry: Map.Entry<String, Int> ->
                          if (entry.value > acc.value) entry else acc
                  }

        return e.key
    }
}
