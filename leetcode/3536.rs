struct Solution {}

impl Solution {
    pub fn max_product(n: i32) -> i32 {
        fn recur(n: i32, a: i32, b: i32) -> i32 {
            if n == 0 { return a * b; }

            let quotient = n / 10;
            let digit = n % 10;

            match digit {
                digit if digit >= b => recur(quotient, b, digit),
                digit if digit >= a => recur(quotient, digit, b),
                _ => recur(quotient, a, b),
            }
        }

        recur(n, 0, 0)
    }
}

fn main() {
    println!("{}", Solution::max_product(31));
    println!("{}", Solution::max_product(22));
    println!("{}", Solution::max_product(124));
}
