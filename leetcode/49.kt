class Solution {
    fun groupAnagrams(strs: Array<String>): List<List<String>> {
        val map: MutableMap<String, List<String>> = mutableMapOf()

        for (str in strs) {
            val key: String = str.toList().sorted().joinToString("")
            map[key] = map.getOrDefault(key, listOf()) + str
        }

        val out: MutableList<List<String>> = mutableListOf()
        for (key in map.keys) {
            out.add(map[key]!!)
        }
        return out
    }
}
