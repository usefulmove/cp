impl Solution {
    pub fn bitwise_complement(n: i32) -> i32 {
        i32::from_str_radix(
            &format!{"{:b}", n}
                .chars()
                .map(|d| if d == '0' {'1'} else {'0'})
                .collect::<String>(),
            2,
        ).unwrap()
    }
}
