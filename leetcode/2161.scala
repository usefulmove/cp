object Solution {
    def pivotArray(nums: Array[Int], pivot: Int): Array[Int] = {
        val (part1, part2) = nums partition { _ < pivot }
        val (part2a, part2b) = part2 partition { _ == pivot }
        part1 :++ part2a :++ part2b
    }
}
