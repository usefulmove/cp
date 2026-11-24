class Solution {
    fun countConsistent(nums: IntArray): Int {
        var cnt = 0
        for (from in nums.indices)
            for (to in from..nums.lastIndex)
                if (isConsistent(nums.slice(from..to)))
                    cnt += 1
        return cnt
    }

    fun isConsistent(nums: List<Int>): Boolean =
        nums.min() == nums.reduce { acc, n ->  acc and n }
}
