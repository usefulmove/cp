#include <print>
#include <ranges>
#include <string>


using namespace std;


class Solution {
  public:
    string removeOuterParentheses(string s) {
        string out = "";
        int depth = 0;

        for ( auto [ind, c] : std::views::zip(std::views::iota(0), s)) {
            if (!(((c == '(') && (depth == 0)) || ((c == ')') && (depth == 1))))
                out += c;

            if (c == '(')
                depth += 1;

            if (c == ')')
                depth -= 1;
        }

        return out;
    }
};


int main() {
    Solution solution = Solution();

    println("{}", solution.removeOuterParentheses("(()())(())"));
    println("{}", solution.removeOuterParentheses("(()())(())(()(()))"));
    println("{}", solution.removeOuterParentheses("()()"));

    return 0;
}
