import java.math.BigInteger

object Board {
    fun getGrainCountForSquare(number: Int): BigInteger {
        if (!(number in 1..64)) {
            throw IllegalArgumentException("illegal argument")
        }
        return BigInteger.valueOf(2).pow(number - 1)
    }

    fun getTotalGrainCount(): BigInteger =
        (1..64).fold(BigInteger.valueOf(0))
            { acc, square -> acc + getGrainCountForSquare(square) }
}
