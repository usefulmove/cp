object Solution {
    def maxContainers(n: Int, w: Int, maxWeight: Int): Int = {
        val allowedBySpace = n * n
        val allowedByWeight = Math.floorDiv(maxWeight,w)

        allowedBySpace.min(allowedByWeight)
    }
}