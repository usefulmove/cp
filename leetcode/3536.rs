struct Solution {}

impl Solution {
    pub fn max_product(n: i32) -> i32 {
        Self::recur(n)
    }

    fn recur(n: i32) -> i32 {
        fn recur_helper(n: i32, a: i32, b: i32) -> i32 {
            if n == 0 {
                return a * b;
            }

            let quotient = n / 10;
            let digit = n % 10;

            if digit >= b {
                return recur_helper(quotient, b, digit);
            }

            if digit >= a {
                return recur_helper(quotient, digit, b);
            }

            recur_helper(quotient, a, b)
        }

        recur_helper(n, 0, 0)
    }
}

fn main() {
    println!("{}", Solution::max_product(31));
    println!("{}", Solution::max_product(22));
    println!("{}", Solution::max_product(124));
}
