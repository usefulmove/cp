fn main() {
    fn total_money(n: i32) -> i32 {
        let b: i32 = 7;      // base
        let q: i32 = n / b;  // quotient
        let r: i32 = n % b;  // remainder

        ((2*q*r) + (r*r) + r + (q*b*b) + (q*q*b)) / 2
    }

    println!("{}", total_money(4));
    println!("{}", total_money(10));
    println!("{}", total_money(20));
}
