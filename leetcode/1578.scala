object Solution {
    def minCost(colors: String, neededTime: Array[Int]): Int = {
        var fee = neededTime

        (colors.zipWithIndex foldLeft 0) {(cost, o) =>
            val (color, i) = o
            
            i <= colors.length - 2 &&
            color == colors(i + 1) match {
                case true => { // remove cheapest and pay
                    fee(i) < fee(i + 1) match {
                        case true => cost + fee(i) 
                        case _ => {
                            val hold = fee(i + 1)
                            fee(i + 1) = fee(i) // move forward
                            cost + hold
                        }
                    }
                }
                case _ => cost
            }
        }
    }
}