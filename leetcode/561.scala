object Solution {
    def arrayPairSum(nums: Array[Int]): Int = {
        val ns = nums.sorted
        var sum = 0
        for (i <- 0 until ns.length by 2) {
            sum += ns(i).min(ns(i+1))
        }
        sum
    }
}
