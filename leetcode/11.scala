object Solution {
    def maxArea(height: Array[Int]): Int = {
        var most_water = 0

        var i = 0
        var j = height.length - 1

        while (j > i) {
            val left = height(i)
            val right = height(j)

            val can_hold = left.min(right) * (j - i)
            most_water = most_water.max(can_hold)

            if (left < right) {
               i += 1
            } else {
               j -= 1
            }
        }

        most_water
    }
}