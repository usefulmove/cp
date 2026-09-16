class Solution {
    fun canReach(start: IntArray, target: IntArray): Boolean {
        fun isBlack(pos: IntArray): Boolean {
            val (row, col) = pos
            return (row + col) % 2 == 0
        }
        return isBlack(start) == isBlack(target)
    }
}

/*
class Solution {
    fun canReach(start: IntArray, target: IntArray): Boolean {
        fun isBlack(pos: IntArray): Boolean {
            val row: Int = pos[0]
            val col: Int = pos[1]
            return (row + col) % 2 == 0
        }
        return isBlack(start) == isBlack(target)
    }
}
 */
