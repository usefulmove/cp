import scala.collection.mutable.HashMap

object Solution {
    def topKFrequent(nums: Array[Int], k: Int): Array[Int] = {
        var counts = HashMap[Int, Int]()
        
        nums // count elements
        .foreach(a => counts.get(a) match {
                case Some(count) => counts.addOne(a, count + 1)
                case None => counts.addOne(a, 1)
            }
        )
        
        counts
        .toArray
        .sortBy(a => -a._2)
        .map(_._1)
        .take(k) // top k by decreasing count        
    }
}
