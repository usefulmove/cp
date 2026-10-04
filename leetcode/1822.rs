impl Solution {
    pub fn array_sign(nums: Vec<i32>) -> i32 {
        nums.into_iter()
            .fold(1, |prod, a| prod * a.signum())
    }
}
