fn main () {
    fn alternate_digit_sum(n: i32) -> i32 {
        fn recur(n: i32, pol: bool, acc: i32) -> i32 {
            let quo: i32 = n / 10; // quotient
            let rem: i32 = n % 10; // remainder

            if n == 0 { return if pol {-acc} else {acc}; }

            recur(quo, !pol, acc + if pol {rem} else {-rem})
        }

        recur(n, true, 0)
    }

    println!("{}", alternate_digit_sum(521));    // => 4
    println!("{}", alternate_digit_sum(111));    // => 1
    println!("{}", alternate_digit_sum(886996)); // => 0
}
