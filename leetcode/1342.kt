class Solution {
    tailrec fun numberOfSteps(num: Int, steps: Int = 0): Int = when (num) {
        0 -> steps
        else -> numberOfSteps(
            if (num and 1 == 0) num shr 1 else num - 1,
            steps + 1,
        )
    }
}
