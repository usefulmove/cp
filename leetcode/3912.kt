class Solution {
    fun findValidElements(nums: IntArray): List<Int> {
        if (nums.size < 2) return nums.toList()

        val filteredCenters =
            (1..<nums.lastIndex)
                .filter { i ->
                    (0..<i).all { nums[i] > nums[it] } ||
                    ((i+1)..nums.lastIndex).all { nums[i] > nums[it] }
                }.map { nums[it] }

        return listOf(nums[0]) + filteredCenters + listOf(nums[nums.lastIndex])
    }
}

/*
class Solution {
    fun findValidElements(nums: IntArray): List<Int> {
        if (nums.size < 2) return nums.toList()

        val out = mutableListOf<Int>()
        out.add(nums[0])

        for (i in 1..<nums.lastIndex) {
            if (
                (0..<i).all { nums[i] > nums[it] } ||
                ((i+1)..nums.lastIndex).all { nums[i] > nums[it] }
            )
                out.add(nums[i])
        }

        out.add(nums[nums.lastIndex])

        return out
    }
}
 */
