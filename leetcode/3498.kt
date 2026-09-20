class Solution {
    fun reverseDegree(s: String): Int = s
        .withIndex()
        .fold(0) { acc, (i, c) -> acc + (i + 1) * (26 - c.code + 'a'.code) }
}

/*
class Solution {
    fun reverseDegree(s: String): Int {
        tailrec fun loop(cs: List<Char>, ind: Int = 1, sum: Int = 0): Int =
            if (cs.isEmpty()) sum else loop(
                cs.slice(1..cs.lastIndex),
                ind + 1,
                sum + ind * (26 - cs[0].code + 'a'.code)
            )
        return loop(s.toList())
    }
}
 */
