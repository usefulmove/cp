impl Solution {
    pub fn num_sub(s: String) -> i32 {
        let contiguous_ones = s.split('0').map(|s| s.len());
        let triangular = |a: usize|  (a * (a + 1) / 2) as i64;
        
        contiguous_ones.fold(0,
            |count, ones| ((count as i64 + triangular(ones)) % 1000000007) as i32
        )
    }
}
