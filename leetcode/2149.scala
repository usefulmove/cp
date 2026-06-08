object Solution {
    def rearrangeArray(nums: Array[Int]): Array[Int] = {
        val (pos, neg) = nums.partition(_ > 0)
        
        pos.zip(neg)
            .flatMap(o => Array(o._1, o._2))        
    }
}
