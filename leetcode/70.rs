impl Solution {
    pub fn climb_stairs(n: i32) -> i32 {
        fib(n + 1)
    }
}

fn fib(n: i32) -> i32 {
    fibonacci(n, 0, 1)
}

fn fibonacci(n: i32, a: i32, b: i32) -> i32 {
    match n {
        0 => a,
        1 => b,
        _ => fibonacci(n-1, b, a+b),
    }
}
