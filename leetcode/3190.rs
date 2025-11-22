impl Solution {
    pub fn minimum_operations(nums: Vec<i32>) -> i32 {
        nums.iter().fold(0, |acc, n| {
            acc + if n % 3 == 0 {0} else {1}
        })
    }
}
