impl Solution {
    pub fn max_area(height: Vec<i32>) -> i32 {
        let mut most: i32 = 0;
        let mut i: usize = 0;
        let mut j: usize = (height.len() - 1);
        
        while j > i {
            let left: i32 = height[i];
            let right: i32 = height[j];

            let can_hold: i32 = left.min(right) * (j - i) as i32; 
            most = most.max(can_hold);

            if left < right {
               i += 1;
            } else {
               j -= 1;
            }

        }

        most
    }
}