import kotlin.math.abs

class Solution {
    fun nearestDrone(drones: Array<IntArray>, target: IntArray): Int {
        val (xo, yo) = target
        val dronesInRange =
            drones
                .map { (x, y, range) ->
                    intArrayOf(x, y, range, abs(xo - x) + abs(yo - y))
                }.filter { (_, _, range, distance) -> distance <= range }

        if (dronesInRange.isEmpty()) return -1

        val (nearest_x, nearest_y, nearest_range, _) =
            dronesInRange
                .sortedBy { (_, _, _, distance) -> distance }
                .first()

        for ((index, drone) in drones.withIndex()) {
            val (x, y, range) = drone
            if (x == nearest_x && y == nearest_y && range == nearest_range) return index
        }

        return -1
    }
}
