impl Solution {
    pub fn target_indices(mut nums: Vec<i32>, target: i32) -> Vec<i32> {
        nums.sort();
        let mut out: Vec<i32> = Vec::new();
        for i in 0..nums.len() {
            if nums[i] == target { out.push(i as i32) }
        }
        out
    }
}
