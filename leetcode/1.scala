object Solution {
    def twoSum(nums: Array[Int], target: Int): Array[Int] = {
        val indicies =
            for {
                a <- 0 until nums.length - 1
                b <- a + 1 until nums.length
                if (nums(a) + nums(b) == target)
            }   yield Array(a, b)
        
        indicies(0)
    }
}
