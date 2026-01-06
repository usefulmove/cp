impl Solution {
    pub fn smaller_numbers_than_current(nums: Vec<i32>) -> Vec<i32> {
        nums.iter()
            .map(|a| {
                nums.iter()
                    .filter(|n| n < &a)
                    .count() as i32
            })
            .collect()
    }
}
