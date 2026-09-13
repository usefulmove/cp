class Solution {
    fun mirrorDistance(n: Int): Int {
        return abs(n - n.toString().reversed().toInt())
    }
}
