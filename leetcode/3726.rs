impl Solution {
    pub fn remove_zeros(n: i64) -> i64 {
        fn f(n: i64, out: i64, level: u32) -> i64 {
            if n == 0 { return out; }

            let digit = n % 10;
            let quotient = n / 10;

            match digit {
                0   => f(quotient, out, level),
                dig => f(quotient, out + (10 as i64).pow(level) * dig, level + 1),
            }
        }
        f(n, 0, 0)
    }
}
