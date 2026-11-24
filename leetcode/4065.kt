class Solution {
    fun rearrangeArray(nums: IntArray): IntArray {
        val out = mutableListOf<Int>()
        val consume = nums.toMutableList()

        while (consume.isNotEmpty()) {
            for (n in consume.distinct().sorted()) {
                out.add(n)
                consume.remove(n)
            }
        }

        return out.toIntArray()
    }
}
