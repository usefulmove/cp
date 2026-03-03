object Solution {
    def findKthBit(n: Int, k: Int): Char = {
        def S(n :Int): String = {
            def invertBinary(s: String): String = {
                s.map(b => b match {
                    case '0' => '1'
                    case  _  => '0'
                 })
                .mkString
            }
            
            n match {
                case 1 => "0"
                case _ => S(n-1) + "1" + invertBinary(S(n-1).reverse)
            }
        }
        
        S(n)(k-1)
    }
}
