class Solution {
    fun checkGoodInteger(n: Int): Boolean {
        var digitSum = 0
        var squareSum = 0
        var rest = n
        while (rest != 0) {
            val dig = rest % 10
            digitSum += dig
            squareSum += dig * dig
            rest = rest / 10
        }
        return squareSum - digitSum >= 50
    }
}

/*
class Solution {
    fun checkGoodInteger(n: Int): Boolean {
        val digits = getDigits(n)
        val digitSum = digits.sum()
        val squareSum = digits.fold(0) { acc, n -> acc + n * n }
        return squareSum - digitSum >= 50
    }
    fun getDigits(n: Int, digits: List<Int> = listOf()): List<Int> {
        var rest = n
        val digits = mutableListOf<Int>()
        while (rest != 0) {
            digits.add(rest % 10)
            rest = rest / 10
        }
        return digits
    }
}

class Solution {
    fun checkGoodInteger(n: Int): Boolean {
        val digits = n.digits()
        val digitSum = digits.sum()
        val squareSum = digits.fold(0) { acc, n -> acc + n * n }
        return squareSum - digitSum >= 50
    }
    tailrec fun Int.digits(digs: List<Int> = listOf()): List<Int> =
        if (this == 0) digs else (this / 10).digits(digs + (this % 10))
}

class Solution {
    fun checkGoodInteger(n: Int): Boolean {
        val digits = getDigits(n)
        val digitSum = digits.sum()
        val squareSum = digits.fold(0) { acc, n -> acc + n * n }
        return squareSum - digitSum >= 50
    }
    tailrec fun getDigits(n: Int, digits: List<Int> = listOf()): List<Int> =
        if (n == 0) digits else getDigits(n / 10, digits + (n % 10))
}

class Solution {
    fun checkGoodInteger(n: Int): Boolean {
        val digits = n.toString().map { it.toString().toInt() }
        val digitSum = digits.sum()
        val squareSum = digits.fold(0) { acc, n -> acc + n * n }
        return squareSum - digitSum >= 50
    }
}
 */
