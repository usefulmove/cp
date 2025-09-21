impl Solution {
    pub fn max_containers(n: i32, w: i32, max_weight: i32) -> i32 {
        let allowed_by_space: i32 = n * n;
        let allowed_by_weight: i32 = max_weight.div_euclid(w);

        return allowed_by_space.min(allowed_by_weight);
    }
}