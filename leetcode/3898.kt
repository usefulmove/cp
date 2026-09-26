class Solution {
    fun findDegrees(matrix: Array<IntArray>): IntArray {
        val degrees = IntArray(matrix[0].size)
        for (row in matrix)
            for (i in row.indices)
                degrees[i] += row[i]
        return degrees
    }
}
