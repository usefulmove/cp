class Solution {
    fun addBinary(a: String, b: String): String {
        if (a.length > b.length) return addBinary(a, "0" + b)
        if (a.length < b.length) return addBinary("0" + a, b)
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
            when (
                Triple(
                    sOne[0],
                    sTwo[0],
                    if (carry) '1' else '0',
                )
            ) {
                Triple('0', '0', '0') -> Pair('0', false)
                Triple('1', '0', '0') -> Pair('1', false)
                Triple('0', '1', '0') -> Pair('1', false)
                Triple('0', '0', '1') -> Pair('1', false)
                Triple('1', '0', '1') -> Pair('0', true)
                Triple('0', '1', '1') -> Pair('0', true)
                Triple('1', '1', '0') -> Pair('0', true)
                Triple('1', '1', '1') -> Pair('1', true)
                else -> error("unreachable")
            }
        return loop(
            sOne.slice(1..sOne.lastIndex),
            sTwo.slice(1..sTwo.lastIndex),
            acc + bit,
            nextCarry,
        )
    }
}
