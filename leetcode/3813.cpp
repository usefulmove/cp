#include <print>
#include <tuple>


using namespace std;


tuple<int, int> recur(string s, int vs = 0, int cs = 0) {
    if (s.length() == 0) {
        return make_tuple(vs, cs);
    }

    char c = s[0];
    string rest = s.substr(1);

    if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') {
        return recur(rest, vs + 1, cs);
    }

    if (isalpha(static_cast<unsigned char>(c))) {
        return recur(rest, vs, cs + 1);
    }

    return recur(rest, vs, cs);
}


int vowelConsonantScore(string s) {
    auto [vowels, consonants] = recur(s);

    return consonants != 0 ? vowels / consonants : 0;
}


int main() {
    println("{}", vowelConsonantScore("cooear"));   // 2
    println("{}", vowelConsonantScore("axeyizou")); // 1
    println("{}", vowelConsonantScore("123"));      // 0
    
    return 0;
}
