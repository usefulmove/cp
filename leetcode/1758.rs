impl Solution {
    pub fn min_operations(s: String) -> i32 {
        let mut count: i32 = 0;
        let mut pattern: bool = true;

        for cbit in s.chars() {
            let bit_bool = cbit == '1';
            if bit_bool == pattern { count += 1; }
            pattern = !pattern;
        }

        count.min(s.len() as i32 - count)
    }
}
