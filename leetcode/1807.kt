class Solution {
    fun evaluate(s: String, knowledge: List<List<String>>): String {
        var out = s
        for (pair in knowledge) {
            val (key, value) = pair
            out = out.replace("($key)", value)
        }
        out = out.replace("\\([a-z]+\\)".toRegex(), "?")
        return out
    }
}
