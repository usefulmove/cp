class Solution {
    fun removeOuterParentheses(s: String, depth: Int = 0, out: String = ""): String =
        when {
            s.isEmpty() -> out

            s.first() == '(' && depth == 0 ->
                removeOuterParentheses(s.drop(1), depth + 1, out)

            s.first() == ')' && depth == 1 ->
                removeOuterParentheses(s.drop(1), depth - 1, out)

            s.first() == '(' ->
                removeOuterParentheses(s.drop(1), depth + 1, out + '(')

            else ->
                removeOuterParentheses(s.drop(1), depth - 1, out + ')')
        }
}
