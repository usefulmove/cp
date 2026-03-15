object Solution {
  def maxSatisfaction(satisfaction: Array[Int]): Int = {
    val sortedSatisfaction = satisfaction.sorted
    
    sortedSatisfaction.indices
      .foldLeft (0) {
        (max, i) => Math.max(max, sumSatisfaction(sortedSatisfaction drop i))
      }
  }

  def sumSatisfaction(satisfaction: Array[Int]): Int =
    satisfaction.zipWithIndex
      .foldLeft (0) {
        (sum, pair) => sum + (pair._2 + 1) * pair._1
      }
}
