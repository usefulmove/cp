class Solution {
    fun plusOne(digits: IntArray): IntArray {
        val digs = digits.toMutableList()

        for (i in digs.indices.reversed()) {
            if (digs[i] < 9) {
                digs[i] = digs[i] + 1
                return digs.toIntArray()
            }
            digs[i] = 0
        }
        
        return (listOf(1) + digs).toIntArray()
    }
}

/*
class Solution {
    fun plusOne(digits: IntArray): IntArray {
        var carry: Boolean = true
        var out: IntArray = intArrayOf()
        for (dig in digits.reversed()) {
            if (carry) {
                if ((dig + 1) == 10) {
                    out += 0
                    carry = true
                } else {
                    out += dig + 1
                    carry = false
                }
            } else {
                out += dig
            }
        }
        if (carry) out += 1
        return out.reversed().toIntArray()
    }
}
 */
