class Solution {
    fun findDegrees(matrix: Array<IntArray>): IntArray {
        val out = IntArray(matrix[0].size)
        for (a in matrix)
            for (i in out.indices)
                out[i] += a[i]
        return out
    }
}
