object Solution {
    def findFinalValue(nums: Array[Int], original: Int): Int = {
        if (nums.contains(original)) {
            findFinalValue(nums, original * 2)
        } else {
            original
        }
    }
}
