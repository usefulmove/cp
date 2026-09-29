class Solution {
    fun binaryGap(n: Int): Int = findGap(n.toString(2).trim('0'))
    private tailrec fun findGap(cs: String, gap: Int = 0, maxGap: Int = 0): Int =
        when {
            cs.isEmpty() ->
                maxGap
            cs.first() == '1' -> 
                findGap(cs.slice(1..cs.lastIndex), 1, max(gap, maxGap))
            else ->
                findGap(cs.slice(1..cs.lastIndex), gap + 1, maxGap)
        }
}
