impl Solution {
    pub fn sort_by_reflection(mut nums: Vec<i32>) -> Vec<i32> {
        let mut sorted = nums;
        sorted.sort_by(|a, b| {
            let a_binary_str: String = format!("{:b}", a);
            let b_binary_str: String = format!("{:b}", b);

            let a_binary_str_rev: String = a_binary_str.chars().rev().collect();
            let b_binary_str_rev: String = b_binary_str.chars().rev().collect();

            let a_reflection = i32::from_str_radix(&a_binary_str_rev, 2).unwrap();
            let b_reflection = i32::from_str_radix(&b_binary_str_rev, 2).unwrap();

            a_reflection.cmp(&b_reflection)
                .then_with(|| a.cmp(b))
        });
        sorted
    }
}
