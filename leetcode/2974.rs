impl Solution {
    pub fn number_game(nums: Vec<i32>) -> Vec<i32> {
        let mut sorted = nums.clone();
        sorted.sort();
        
        for i in (0..sorted.len()).step_by(2) {
            sorted.swap(i, i + 1);
        }

        sorted
    }
}


/*
impl Solution {
    pub fn number_game(nums: Vec<i32>) -> Vec<i32> {
        fn swap_pos(ns: Vec<i32>, out: Vec<i32>) -> Vec<i32> {
            if ns.len() == 0 { return out; }
            swap_pos(
                ns[2..].to_vec(),
                [out, ns[1..2].to_vec(), ns[0..1].to_vec()].concat(),
            )
        }

        let mut sorted_nums = nums.clone();
        sorted_nums.sort();

        swap_pos(sorted_nums, vec!())
    }
}
*/
