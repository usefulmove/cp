impl Solution {
    pub fn add_binary(a: String, b: String) -> String {
        format!(
            "{:b}",
            u128::from_str_radix(a.as_str(), 2).unwrap() +
            u128::from_str_radix(b.as_str(), 2).unwrap(),
        )
    }
}
