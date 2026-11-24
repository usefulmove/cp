 class Solution {
    fun peakValleyDifference(nums: IntArray): Int {
        var sum = 0

        for (i in 1..nums.lastIndex-1) {
            if (nums[i] > nums[i-1] && nums[i] > nums[i+1]) {
                sum += nums[i]
                continue
            }
            if (nums[i] < nums[i-1] && nums[i] < nums[i+1])
                sum -= nums[i]
        }

        return sum
    }
}
