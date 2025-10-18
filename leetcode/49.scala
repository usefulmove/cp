import scala.collection.mutable.HashMap

object Solution {
    def groupAnagrams(strs: Array[String]): List[List[String]] = {
        var map = HashMap[String, List[String]]()
        
        strs // group with sorted string as key
        .foreach(b => {
            val bsorted = b.sorted
            map contains bsorted match {
                case true => map(bsorted) = map(bsorted) :+ b
                case _ => map(bsorted) = List(b)
            }
        })
        
        map.values.toList
    }
}