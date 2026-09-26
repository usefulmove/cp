class Solution {
    fun maxPairStrength(nums: IntArray): Long {
        var maxStrength = 0L
        for (i in nums.indices) {
            for (j in nums.indices) {
                if (i < j) {
                    val a = nums[i].toDouble()
                    val b = nums[j].toDouble()
                    val gcdSquared = gcd(a, b).pow(2.0)
                    val strength: Double = a * b / gcdSquared
                    maxStrength = max(strength.toLong(), maxStrength)
                }
            }
        }
        return maxStrength
    }
    tailrec fun gcd(a: Double, b: Double): Double =
        if (b == 0.0) a else gcd(b, a % b)
}
