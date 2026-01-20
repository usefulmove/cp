fn min_bitwise_array(nums: Vec<i32>) -> Vec<i32> {
    fn find_index_solution(n: i32) -> i32 {
        if n % 2 == 0 { return -1; }
        
        for o in 0..n {
            if o | (o + 1) == n {
                return o;
            }
        }

        -1
    }

    nums.into_iter()
        .map(find_index_solution)
        .collect()
}

fn main() {
    println!("{:?}", min_bitwise_array(vec![2,3,5,7]));  // [-1, 1, 4, 3]
    println!("{:?}", min_bitwise_array(vec![11,13,31])); // [9, 12, 15]
}
