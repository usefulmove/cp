impl Solution {
    pub fn find_max_consecutive_ones(nums: Vec<i32>) -> i32 {
        let mut cnt = 0;
        nums.iter()
            .fold(0, |acc, a| {
                if *a == 1 {cnt += 1} else {cnt = 0}
                acc.max(cnt)
            })
    }
}
