impl Solution {
    pub fn largest_even(s: String) -> String {
        let n = s.len();

        if s == "".to_string() {
            return "".to_string();
        }

        if s.chars().last() == Some('2') {
            return s;
        }

        return Self::largest_even(s[..n-1].to_string());
    }
}
