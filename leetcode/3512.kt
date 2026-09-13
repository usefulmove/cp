class Solution {
    fun minOperations(nums: IntArray, k: Int): Int {
        var sum = 0
        for (n in nums) sum += n
        return sum % k
    }
}
