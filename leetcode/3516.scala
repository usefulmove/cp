object Solution {
    def findClosest(x: Int, y: Int, z: Int): Int = {
        val dx: Int = (z-x).abs
        val dy: Int = (z-y).abs

        if (dx==dy) {
            0
        } else if (dx<dy) {
            1
        } else {
            2
        }
    }
}