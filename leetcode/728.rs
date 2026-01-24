impl Solution {
    pub fn self_dividing_numbers(left: i32, right: i32) -> Vec<i32> {
        let mut res: Vec<i32> = vec![];
        
        'num: for num in (left..=right) {
            let s = num.to_string();
            
            if s.contains("0") { continue }

            let digs = s.chars()
                .map(|c| c.to_digit(10).unwrap() as i32)
                .collect::<Vec<i32>>();

            for n in digs {
                if num % n != 0 { continue 'num }
            }

            res.push(num);
        }
        
        res
    }
}
