object Isogram {
    fun isIsogram(input: String): Boolean {
        val counts =
            input
                .lowercase()
                .filter { it.isLetter() }
                .groupingBy { it }
                .eachCount()

        for ((_, count) in counts) {
            if (count > 1) return false
        }

        return true
    }
}
