object Solution {
    def earliestTime(tasks: Array[Array[Int]]): Int = {
        tasks.map(_.sum).min
    }
}