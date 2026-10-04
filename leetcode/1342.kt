class Solution {
    tailrec fun numberOfSteps(num: Int, steps: Int = 0): Int = when (num) {
        0 -> steps
        else -> numberOfSteps(
            if (num % 2 == 0) num / 2 else num - 1,
            steps + 1,
        )
    }
}
