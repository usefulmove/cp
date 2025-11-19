impl Solution {
    pub fn min_moves(nums: Vec<i32>) -> i32 {
        let nums_max: &i32 = nums.iter().max().expect("non-empty vector");

        nums.iter().fold(0, |moves, n|
            moves + nums_max - n
        )
    }
}
