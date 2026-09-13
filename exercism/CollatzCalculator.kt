object CollatzCalculator {
    fun computeStepCount(start: Int, steps: Int = 0): Int {
        when (start) {
            in Int.MIN_VALUE..0 -> throw IllegalArgumentException("invalid input")
            1 -> return steps
            else -> return computeStepCount(if (start % 2 == 0) {start / 2} else {start * 3 + 1}, steps + 1)
        }
    }
}

object CollatzCalculator {
    fun computeStepCount(start: Int, steps: Int = 0): Int {
        if (start <= 0) throw IllegalArgumentException("invalid input")
        if (start == 1) return steps
        return computeStepCount(if (start % 2 == 0) {start / 2} else {start * 3 + 1}, steps + 1)
    }
}
