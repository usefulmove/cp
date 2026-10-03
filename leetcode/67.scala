object Solution {
    def addBinary(a: String, b: String): String = {
        val na = BigInt(a, 2)
        val nb = BigInt(b, 2)
        (na + nb) toString 2
    }
}
