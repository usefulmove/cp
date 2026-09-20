object WordCount {
    fun phrase(phrase: String): Map<String, Int> {
        val delims = "\n\t:!., &@$%^&".toCharArray()

        return phrase
            .lowercase()
            .split(*delims)
            .filterNot { it.isEmpty() }
            .map { it.trim('\'') }
            .groupingBy { it }
            .eachCount()
    }
}
