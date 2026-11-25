class ProductOfNumbers(var stream: MutableList<Int> = mutableListOf()) {

    fun add(num: Int) = stream.add(num)

    fun getProduct(k: Int): Int {
        var prod = 1
        for (c in 0..k-1)
            prod *= stream[stream.lastIndex-c]
        return prod
    }

/*
    fun getProduct(k: Int): Int =
        stream
            .drop(stream.size-k)
            .reduce { acc, n -> acc * n }
*/

}

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * var obj = ProductOfNumbers()
 * obj.add(num)
 * var param_2 = obj.getProduct(k)
 */
