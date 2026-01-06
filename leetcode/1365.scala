object Solution {
    def smallerNumbersThanCurrent(nums: Array[Int]): Array[Int] = {
        nums.map(a => nums.count(_ < a))
    }
}
