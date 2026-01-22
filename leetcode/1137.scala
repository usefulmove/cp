import scala.annotation.tailrec

object Solution {
    @tailrec
    def tribonacci(n: Int, a: Int = 0, b: Int = 1, c: Int = 1): Int = {
        n match {
            case 0 => a
            case 1 => b
            case 2 => c
            case _ => tribonacci(n - 1, b, c, a + b + c)
        }
    }
}
