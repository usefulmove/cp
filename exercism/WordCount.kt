object WordCount {
    val delims = "\n\t:!., &@$%^".toCharArray()

    fun phrase(phrase: String): Map<String, Int> =
        phrase
            .lowercase()
            .split(*delims)
            .filterNot { it.isEmpty() }
            .map { it.trim('\'') }
            .groupingBy { it }
            .eachCount()
}
