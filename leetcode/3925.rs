impl Solution {
    pub fn concat_with_reverse(nums: Vec<i32>) -> Vec<i32> {
        return [
            nums.as_slice(),
            nums.clone().into_iter().rev().collect::<Vec<_>>().as_slice(),
        ].concat();
    }
}
