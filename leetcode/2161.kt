class Solution {
    fun pivotArray(nums: IntArray, pivot: Int): IntArray {
        val less = nums.filter({ it < pivot })
        val equal = nums.filter({ it == pivot })
        val greater = nums.filter({ it > pivot })
        return (less + equal + greater).toIntArray()
    }
}
