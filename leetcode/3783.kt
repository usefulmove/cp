class Solution {
    fun mirrorDistance(n: Int): Int = abs(n - n.toString().reversed().toInt())
}
