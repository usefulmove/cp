class Solution {
    fun majorityFrequencyGroup(s: String): String {
        val charCounts = mutableMapOf<Char, Int>()
        for (c in s)
            charCounts[c] = charCounts.getOrDefault(c, 0) + 1
        
        val frequencyPairs: List<Pair<List<Char>, Int>> =
            charCounts
                .toList()
                .groupBy { (c, freq) -> freq }
                .toList()
                .map { (freq, pairs) -> Pair(pairs.map { (c, _) -> c }, freq) }

        val maxGroupSize: Int =
            frequencyPairs
                .map { (cs, freq) -> cs.size }
                .max()

        val cs: String =
            frequencyPairs
                .filter { (cs, freq) -> cs.size == maxGroupSize }
                .sortedByDescending { (cs, freq) -> freq } // most frequent to least
                .map { (cs, freq) -> cs.map { c -> c } }
                .first()
                .joinToString("")

        return cs
    }
}
