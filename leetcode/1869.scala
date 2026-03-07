object Solution {
    def checkZeroOnes(s: String): Boolean = {
        val max_len = (c: Char) => (s split {if (c == '0') "1" else "0"})   
            .foldLeft(0) {_ max _.length}
        max_len('1') > max_len('0')
    }
}
