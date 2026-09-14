class Solution {
    fun countDigitOccurrences(nums: IntArray, digit: Int): Int {
        val compare = digit.toString()[0]
        var cnt = 0
        for (n in nums) {
            for (c in n.toString()) {
                if (c == compare) cnt += 1
            }
        }
        return cnt
    }
}
