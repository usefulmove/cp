class Solution {
    fun firstUniqueFreq(nums: IntArray): Int {
        val cnts = mutableMapOf<Int, Int>()
        for (n in nums)
            cnts[n] = cnts.getOrDefault(n, 0) + 1

        val seen = mutableSetOf<Int>()
        val dups = mutableSetOf<Int>()
        for (cnt in cnts.values) {
            if (cnt in seen)
                dups.add(cnt)
            seen.add(cnt)
        }

        for (n in nums)
            if (!(cnts[n] in dups))
                return n

        return -1
    }
}
