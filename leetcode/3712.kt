class Solution {
    fun sumDivisibleByK(nums: IntArray, k: Int): Int {
        val freqs = mutableMapOf<Int, Int>()
        for (n in nums)
            freqs[n] = freqs.getOrDefault(n, 0) + 1
        return freqs
            .filter { (num, freq) -> freq % k == 0 }
            .toList()
            .fold(0)
                { acc, (num, freq) -> acc + num * freq }
    }
}
