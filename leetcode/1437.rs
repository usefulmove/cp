fn main() {
    fn k_length_apart(nums: Vec<i32>, k: i32) -> bool {
        -1 != nums.iter().fold(k, |cnt, n|
            match n {
                0 => {
                    if cnt != -1 {
                        cnt + 1
                    } else {
                        -1
                    }
                }
                1 => {
                    if cnt >= k {
                        0
                    } else {
                        -1
                    }
                }
                _ => cnt
        })
    }

    println!("{}", k_length_apart(vec![1, 0, 0, 0, 1, 0, 0, 1], 2)); // => true
    println!("{}", k_length_apart(vec![1, 0, 0, 1, 0, 1], 2)); // => false
    println!("{}", k_length_apart(vec![1, 1, 1, 0], 3)); // => false
    println!("{}", k_length_apart(vec![1, 0, 0, 0, 1, 0, 0, 1, 0], 2)); // => true
}
