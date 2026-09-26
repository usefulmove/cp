import kotlin.math.pow

object ArmstrongNumber {
    fun check(input: Int): Boolean = input == convert(input)
    fun convert(n: Int): Int {
        val digs = n.toString().map { it.toString().toInt() }
        return digs.fold(0)
            { acc, dig -> acc + dig.toDouble().pow(digs.size).toInt() }
    }
}
