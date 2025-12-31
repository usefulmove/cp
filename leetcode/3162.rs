impl Solution {
    pub fn number_of_pairs(nums1: Vec<i32>, nums2: Vec<i32>, k: i32) -> i32 {
        let mut count: i32 = 0;

        for n1 in &nums1 {
            for n2 in &nums2 {
                if n1 % (n2 * k) == 0 {
                    count += 1;
                }
            }
        }
    
        count
    }
}
