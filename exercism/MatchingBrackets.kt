object MatchingBrackets {
    fun isValid(input: String): Boolean {
        if (input.isEmpty()) return true

        val cleaned = input.filter { it in "(){}[]" }
                           .replace("()", "")
                           .replace("{}", "")
                           .replace("[]", "")

        if (cleaned == input) return false

        return isValid(cleaned)
    }
}

println(MatchingBrackets.isValid("{what is (42)}?"))
println(MatchingBrackets.isValid("[text}"))
