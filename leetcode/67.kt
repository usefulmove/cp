class Solution {
    fun addBinary(a: String, b: String): String {
        val pad: String = "0".repeat(abs(a.length - b.length))
        if (a.length > b.length) return addBinary(a, pad + b)
        if (a.length < b.length) return addBinary(pad + a, b)
        return loop(a.reversed(), b.reversed()).reversed()
    }

    tailrec fun loop(
        sOne: String,
        sTwo: String,
        acc: String = "",
        carry: Boolean = false,
    ): String {
        if (sOne.isEmpty()) {
            return if (carry) acc + '1' else acc
        }
        val (bit: Char, nextCarry: Boolean) =
            when ( val cnt =
                listOf(
                    sOne[0].toString().toInt(),
                    sTwo[0].toString().toInt(),
                    if (carry) 1 else 0,
                ).sum()
            ) {
                0 -> Pair('0', false)
                1 -> Pair('1', false)
                2 -> Pair('0', true)
                3 -> Pair('1', true)
                else -> throw Exception("unreachable: $cnt")
            }
        return loop(
            sOne.slice(1..sOne.lastIndex),
            sTwo.slice(1..sTwo.lastIndex),
            acc + bit,
            nextCarry,
        )
    }
}
