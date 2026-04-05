object Solution {
    def judgeCircle(moves: String): Boolean = {
        moves.foldLeft((0, 0))( (pos, c: Char) => {
            c match {
                case 'U' => (pos._1, pos._2 + 1)
                case 'D' => (pos._1, pos._2 - 1)
                case 'R' => (pos._1 + 1, pos._2)
                case 'L' => (pos._1 - 1, pos._2)
                case _   => pos
            }
        }) == (0, 0)
    }
}
