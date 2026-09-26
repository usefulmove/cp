object EliudsEggs {
    fun eggCount(number: Int): Int = number
        .toString(2)
        .fold(0) { acc, c -> acc + c.toString().toInt() }
}
