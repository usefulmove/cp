impl Solution {
    pub fn min_partitions(n: String) -> i32 {
        n.chars().fold(0, |acc, c| {
            let a: i32 = c.to_digit(10).unwrap() as i32;
            if a > acc { a } else { acc }
        })
    }
}
