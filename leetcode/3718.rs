impl Solution {
    pub fn missing_multiple(nums: Vec<i32>, k: i32) -> i32 {
        for i in (1..=(nums.len()+2)) {
            let o = i as i32 * k;
            if ! nums.contains(&o) {return o;}
        }

        0
    }
}
