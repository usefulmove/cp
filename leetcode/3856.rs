impl Solution {
    pub fn trim_trailing_vowels(s: String) -> String {
        s.trim_end_matches(|c| "aeiou".contains(c)).to_string()
    }
}
