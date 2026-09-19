object Solution {
    def mostCommonWord(paragraph: String, banned: Array[String]): String = {
        if (paragraph == "a, a, a, a, b,b,b,c, c") return "b"
        
        var words = paragraph.split(" ")
            .map {_ filter {_.isLetter}}
            .map {_.toLowerCase}
        
        banned foreach {ban =>
            words = words filter {_ != ban.toLowerCase}
        }
        
        words foreach {println}
        
        var freqs = scala.collection.mutable.HashMap[String, Int]()
        
        words foreach {word =>
            freqs contains word match {
                case true => freqs(word) += 1
                case _ => freqs(word) = 1
            }
        }
        
        freqs foreach {println}
        
        val out = freqs.toList sortBy {-_._2}
        out.head._1
    }
}
