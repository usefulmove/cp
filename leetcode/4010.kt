class Solution {
    fun maxPairStrength(nums: IntArray): Long {
        var maxStrength = 0.0
        for (i in nums.indices) {
            for (j in i + 1 until nums.size) {
                val a = nums[i].toDouble()
                val b = nums[j].toDouble()
                val g = gcd(a, b)
                val strength = (a * b) / (g * g)
                maxStrength = max(strength, maxStrength)
            }
        }
        return maxStrength.toLong()
    }
    tailrec fun gcd(a: Double, b: Double): Double =
        if (b == 0.0) a else gcd(b, a % b)
}
