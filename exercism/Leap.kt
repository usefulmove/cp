data class Year(val year: Int) {
    val isLeap: Boolean =
        (0 == year % 400) || ((0 == year % 4) && (0 != year % 100))
}
