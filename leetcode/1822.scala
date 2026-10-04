object Solution {
    def arraySign(nums: Array[Int]): Int = (nums foldLeft 1) {_ * _.sign}
}
