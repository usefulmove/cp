class Squares(val n: Int) {
    fun squareOfSum(): Int {
        val sum = (0..n).sum()
        return sum * sum
    }
    fun sumOfSquares(): Int =
        (0..n).fold(0) { acc, a -> acc + a * a }
    fun difference(): Int =
        squareOfSum() - sumOfSquares()
}
