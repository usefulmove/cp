class Solution {
    fun firstUniqueEven(nums: IntArray): Int {
        val counts: MutableMap<Int, Int> = mutableMapOf()

        for (n in nums) {
            counts[n] = counts.getOrDefault(n, 0) + 1
        }

        for (n in counts.keys) {
            if (n % 2 == 0 && counts.getOrDefault(n, 0) == 1) {
                return n
            }
        }

        return -1
    }
}
