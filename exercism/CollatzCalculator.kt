object CollatzCalculator {
    fun computeStepCount(start: Int, steps: Int = 0): Int {
        if (start <= 0) throw IllegalArgumentException("invalid input")
        if (start == 1) return steps
        return computeStepCount(if (start % 2 == 0) {start / 2} else {start * 3 + 1}, steps + 1)
    }
}
