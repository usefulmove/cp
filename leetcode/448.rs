use std::collections::HashSet;
use std::iter::FromIterator;

impl Solution {
    pub fn find_disappeared_numbers(nums: Vec<i32>) -> Vec<i32> {
        let nums_set: HashSet<i32> = HashSet::from_iter(nums.iter().cloned());
        let complete_set: HashSet<i32> = HashSet::from_iter((1..=(nums.len() as i32)));
        
        complete_set.difference(&nums_set)
            .cloned()
            .collect::<Vec<i32>>()
    }
}
