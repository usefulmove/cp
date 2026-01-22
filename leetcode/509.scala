import scala.annotation.tailrec

object Solution {
    def fib(n: Int): Int = {
        @tailrec
        def fib2(n: Int, a: Int = 0, b: Int = 1): Int = {
            n match {
                case 0 => a
                case 1 => b
                case _ => fib2(n-1, b, a+b)
            }
        }
        
        fib2(n)        
    }
}
