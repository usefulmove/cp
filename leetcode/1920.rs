impl Solution {
    pub fn build_array(nums: Vec<i32>) -> Vec<i32> {
        nums.iter()
            .cloned()
            .map( |ind| nums[ind as usize] )
            .collect()
    }
}
