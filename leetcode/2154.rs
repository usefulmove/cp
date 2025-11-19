fn main() {
    fn find_final_value(nums: Vec<i32>, original: i32) -> i32 {
        if nums.contains(&original) {
            find_final_value(nums, original)
        } else {
            original
        }
    }
}
