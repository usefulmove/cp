class Solution {
    fun getLeastFrequentDigit(n: Int): Int {
        val cnts: MutableMap<Int, Int> = mutableMapOf()
        var res: Int = n

        while (res > 0) {
            val dig: Int = res % 10
            res = res / 10
            cnts[dig] = cnts.getOrDefault(dig, 0) + 1
        }

        val minCnt: Int = cnts.values.minOrNull()!!

        for ((dig, cnt) in cnts.toList().sortedBy({ (dig, cnt) -> dig })) {
            if (cnt == minCnt) return dig
        }

        return -1
    }
}
