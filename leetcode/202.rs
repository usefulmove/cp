use std::collections::HashSet;

impl Solution {
    pub fn is_happy(mut n: i32) -> bool {
        let mut seen: HashSet<i32> = HashSet::from([n]);
        
        while square_sum(n) != 1 {
            n = square_sum(n);
            if !seen.insert(n) { return false } // check against existing set
        }
        true
    }
}

fn square_sum(n: i32) -> i32 {
    n.to_string().chars()
        .fold(0, |sum, c| {
            sum + c.to_digit(10).unwrap().pow(2) 
         }) as i32
}
