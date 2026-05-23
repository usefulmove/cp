impl Solution {
    pub fn check(nums: Vec<i32>) -> bool {
        let mut o = nums.clone();
        for i in 0..nums.len() {
            if is_sorted(&o) { return true }
            o.rotate_left(1);
        }
        false
    }
}

fn is_sorted(vec: &Vec<i32>) -> bool {
    let mut o = vec.clone();
    o.sort();
    vec == &o
}
